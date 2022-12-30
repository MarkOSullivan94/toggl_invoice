import 'dart:convert';

import 'package:calculate_invoice/constants/invoice.dart';
import 'package:calculate_invoice/constants/toggl.dart';
import 'package:calculate_invoice/model/invoice_dates.dart';
import 'package:calculate_invoice/model/money.dart';
import 'package:calculate_invoice/model/summary.dart';
import 'package:http/http.dart';
import 'package:jiffy/jiffy.dart';

class TogglService {
  Future<void> start() async {
    await fetchSummary();
  }

  Future<TogglSummary?> fetchSummary() async {
    print('Attempting to fetch Toggl report summary please wait ...');

    final invoiceDates = getInvoiceDates();

    final queryParams = {
      'user_agent': userAgent,
      'workspace_id': workspaceId,
      'since': invoiceDates.apiSince,
      'until': invoiceDates.apiUntil
    };

    final authority = 'api.track.toggl.com';
    final unencodedPath = 'reports/api/v2/summary';
    final uri = Uri.https(authority, unencodedPath, queryParams);

    final basicAuth = 'Basic ' + base64Encode(utf8.encode('$userName:$password'));

    final response = await get(
      uri,
      headers: {'authorization': basicAuth},
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final summary = TogglSummary.fromJson(jsonMap);
      printInvoiceDetails(invoiceDates, summary);
    } else {
      throw Exception(
          'Unable to fetch Toggl summary details: HTTP Status code - $statusCode');
    }
  }

  // Generates both the since and until dates based on configuration set
  // in the  constants file
  InvoiceDates getInvoiceDates() {
    final now = DateTime.now();
    final untilMonth = now.month;
    final untilYear = now.year;
    late int sinceMonth;
    late int sinceYear;

    if (untilMonth == 1) {
      sinceMonth = 12;
      sinceYear = now.year - 1;
    } else {
      sinceMonth = untilMonth - 1;
      sinceYear = now.year;
    }

    final sinceDate = '$sinceYear-$sinceMonth-$invoiceSinceDate';
    final untilDate = '$untilYear-$untilMonth-$invoiceUntilDate';

    final until = Jiffy(untilDate);
    final since = Jiffy(sinceDate);
    return InvoiceDates(since, until);
  }

  void printInvoiceDetails(
    InvoiceDates dates,
    TogglSummary summary,
  ) {
    final totalBillableHoursInMilliseconds = summary.totalBillable!;
    final hoursWorked = _convertToHours(totalBillableHoursInMilliseconds);
    final hoursWorkedClean = hoursWorked.toStringAsFixed(4);
    final money = Money(amount: hoursWorked.floor() * hourlyRate);

    // Ensure vatPercentage has been added to constants/invoice.dart file
    //
    // If VAT is not needed then set value to 0.0
    final vatAmount = money.amount * (1.0 + vatPercentage);
    final vatMoney = Money(amount: vatAmount);

    print('\n===================');
    print('INVOICE DETAILS');
    print('===================');
    print('Since: ${dates.since}');
    print('Until: ${dates.until}\n');
    for (TogglData data in summary.data) {
      print('${summary.data.indexOf(data) + 1}: ${data.title.project}');
      print('Hours: ${_convertToHours(data.time)}\n');
    }
    print('Overall hours: $hoursWorkedClean');
    print('Total: ${money.toStringWithCurrencySign()} ($hoursWorkedClean hours × $currencySign${hourlyRate.toStringAsFixed(2)})');
    if (vatPercentage != 0.0) {
      print('With 20% VAT: ${vatMoney.toStringWithCurrencySign()} ($hoursWorkedClean hours × $currencySign${hourlyRate.toStringAsFixed(2)})');
    }
  }

  double _convertToHours(int milliseconds) {
    final secondsWorked = milliseconds / 1000;
    final minutesWorked = secondsWorked / 60;
    final hoursWorked = minutesWorked / 60;
    return hoursWorked;
  }
}

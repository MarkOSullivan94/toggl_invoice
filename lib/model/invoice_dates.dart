// Need both since and until date to know what period to generate invoice for
// date format is YYYY-MM-DD
import 'package:calculate_invoice/constants.dart';
import 'package:jiffy/jiffy.dart';

class InvoiceDates {

  const InvoiceDates(this._sinceDate, this._untilDate);

  final Jiffy _sinceDate;
  final Jiffy _untilDate;

  String get apiSince => _sinceDate.format(apiDateFormat);

  String get apiUntil => _untilDate.format(apiDateFormat);

  String get since => _sinceDate.format(displayDateFormat);

  String get until => _untilDate.format(displayDateFormat);
}

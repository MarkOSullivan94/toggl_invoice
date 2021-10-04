// Need both since and until date to know what period to generate invoice for
// date format is YYYY-MM-DD
import 'package:jiffy/jiffy.dart';

const _apiDateFormat = 'yyyy-MM-dd';
const _displayDateFormat = 'do MMMM yyyy';

class InvoiceDates {

  const InvoiceDates(this._sinceDate, this._untilDate);

  final Jiffy _sinceDate;
  final Jiffy _untilDate;

  String get apiSince => _sinceDate.format(_apiDateFormat);
  String get apiUntil => _untilDate.format(_apiDateFormat);
  String get since => _sinceDate.format(_displayDateFormat);
  String get until => _untilDate.format(_displayDateFormat);
}

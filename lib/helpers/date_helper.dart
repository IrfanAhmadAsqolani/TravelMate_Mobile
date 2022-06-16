import '../dependencies/dependencies.dart';

class DateHelper {
  static String getReadableDate(DateTime? date, {String? format}) {
    if (date == null) {
      return '';
    }
    return DateFormat(format ?? 'dd MMMM yyyy').format(date);
  }
}

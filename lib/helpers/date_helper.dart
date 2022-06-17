import '../dependencies/dependencies.dart';

class DateHelper {
  static String getReadableDate(DateTime? date, {String? format}) {
    if (date == null) {
      return '';
    }
    return DateFormat(format ?? 'dd MMMM yyyy').format(date);
  }

  static bool isBeforeToday(DateTime? date) {
    if (date == null) {
      return false;
    }
    return date.difference(DateTime.now()).inDays > 0;
  }
}

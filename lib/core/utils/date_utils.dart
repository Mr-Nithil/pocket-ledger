class DateUtilsX {
  static String monthLabel(int year, int month) {
    final paddedMonth = month.toString().padLeft(2, '0');
    return '$year-$paddedMonth';
  }
}

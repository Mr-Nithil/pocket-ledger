import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format({
    required double amount,
    String symbol = '',
    String? locale,
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );

    return formatter.format(amount);
  }
}

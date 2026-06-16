import '../utils/currency_formatter.dart';

extension DoubleX on double {
  String formatMoney({String symbol = '', String? locale}) {
    return CurrencyFormatter.format(
      amount: this,
      symbol: symbol,
      locale: locale,
    );
  }
}

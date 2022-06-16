import 'package:intl/intl.dart';

class MoneyFormatter {
  static final _vnCurrencyFormat =
      NumberFormat.currency(locale: 'vi_VN', symbol: '', decimalDigits: 0);

  static String transformMoneyToNormalString(String money) {
    money = money.replaceAll(RegExp(r"\s+\b|\b\s"), '');
    money = money.replaceAll('.', '');
    return money.trim();
  }

  static String transformMoneyToVNCurrency(String money) {
    return _vnCurrencyFormat.format(int.parse(money));
  }
}

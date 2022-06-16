class NumberTransformer {
  static double roundingDouble(double numb, {int numberAfterDecimalPoint = 2}) {
    return double.parse(numb.toStringAsFixed(numberAfterDecimalPoint));
  }

  static String transformPercentage(double numb) {
    return '${numb * 100}%';
  }
}

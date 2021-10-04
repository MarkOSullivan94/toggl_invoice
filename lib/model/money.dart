import 'dart:math' as math;

import 'package:calculate_invoice/constants/invoice.dart';

class Money {
  final double amount;

  const Money({required this.amount});

  /// returns the string representation of the money with the £ currency sign
  String toStringWithCurrencySign() {
    return '$currencySign${amount.toStringAsFixed(2)}';
  }

  /// returns the string representation of the money with the £ currency sign along with suffix e.g. M / k
  String toStringWithCurrencySignAndSuffix({bool isUppercaseSuffix = false}) {
    final value = amount;
    final millionSuffix = isUppercaseSuffix ? 'M' : 'm';
    final thousandSuffix = isUppercaseSuffix ? 'K' : 'k';

    // value is greater than or equal to 1M
    if (value >= 1000000) {
      final convertedValue = (value / math.pow(10, 6)).toStringAsFixed(2);
      final splitValues = convertedValue.split('.');

      // avoid showing decimals if the decimals are all 0
      if (splitValues[1] == '00') {
        return '$currencySign${splitValues[0]}$millionSuffix';
      }
      return '$currencySign$convertedValue$millionSuffix';
    }
    // value is greater than or equal to 100K
    else if (value >= 100000) {
      final convertedValue = (value / math.pow(10, 3)).toStringAsFixed(2);
      final splitValues = convertedValue.split('.');

      // avoid showing decimals if the decimals are all 0
      if (splitValues[1] == '00') {
        return '$currencySign${splitValues[0]}$thousandSuffix';
      }
      return '$currencySign$convertedValue$thousandSuffix';
    }
    return '$currencySign${amount.toStringAsFixed(2)}';
  }
}

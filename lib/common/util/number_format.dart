import 'package:easy_localization/easy_localization.dart';

NumberFormat numberFormat = NumberFormat.currency(
  //decimalDigits: 0,
  symbol: ',',
);
int hexToInt(String hex) {
  int val = 0;
  int len = hex.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = hex.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw const FormatException('Invalid hexadecimal value');
    }
  }
  return val;
}

String formatNumberWithCommas(int number) {
  String reversedNumber = number.toString().split('').reversed.join();
  String formattedNumber = '';

  for (int i = 0; i < reversedNumber.length; i++) {
    formattedNumber += reversedNumber[i];
    if ((i + 1) % 3 == 0 && i != reversedNumber.length - 1) {
      formattedNumber += ',';
    }
  }

  return formattedNumber.split('').reversed.join();
}

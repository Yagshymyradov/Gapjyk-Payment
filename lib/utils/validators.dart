import 'package:flutter/material.dart';

class Validator {
  static String? emptyField(
    BuildContext context,
    String? value,
  ) {
    if (value == null) {
      return null;
    }
    final trimmedValue = value.trimRight();
    if (trimmedValue.isEmpty) {
      return 'Boşlugy dolduryň';
    }
    return null;
  }

  static String? phoneValidate(BuildContext context, String? phone) {
    if (phone == null || phone.isEmpty) return 'Telefon beligiňizi giriziň';

    final trimmedValue = phone.trim();
    if (trimmedValue.length >= 8) {
      const allowedPhonePrefixes = ['60', '61', '62', '63', '64', '65', '70', '71'];
      if (allowedPhonePrefixes.contains(phone.substring(0, 2))) {
        return null;
      }
    }
    return 'Nädogry belgi';
  }
}

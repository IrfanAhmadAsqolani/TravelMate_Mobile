import 'package:flutter/material.dart';

import '../utils.dart';

class CustomInputDecoration {
  static InputDecoration defaultDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyles.heading5Regular(
        color: CustomColors.darkGrey.withOpacity(0.3),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: CustomColors.black),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: CustomColors.black),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: CustomColors.black),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: CustomColors.black),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static TextStyle heading1({Color? color}) {
    return TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading2({Color? color}) {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading3({Color? color}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading4({Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading5SemiBold({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading5Regular({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading6({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading7Regular({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static TextStyle heading7SemiBold({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
}

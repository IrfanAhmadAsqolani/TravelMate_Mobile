import 'package:flutter/material.dart';

class Typography {
  TextStyle heading1({Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
}

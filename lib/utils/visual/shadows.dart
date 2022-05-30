import 'package:flutter/material.dart';

class Shadows {
  static List<BoxShadow> defaultShadow() {
    return [
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 10,
        color: Colors.black.withOpacity(0.1),
      ),
    ];
  }
}

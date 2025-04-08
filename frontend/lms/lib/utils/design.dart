import 'package:flutter/material.dart';

class AppDesign {
  static const TextStyle heading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const EdgeInsets pagePadding = EdgeInsets.all(16);

  static BoxDecoration cardShadow = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 8),
    ],
  );
}

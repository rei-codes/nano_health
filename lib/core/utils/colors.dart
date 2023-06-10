import 'package:flutter/material.dart';

abstract final class AppColors {
  static const blue = Color(0xFF2AB3C6);
  static const naviBlue = Color(0xFF08293B);
  static const darkBlue = Color(0xFF188095);

  static const gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [darkBlue, blue],
  );
}

import 'package:flutter/material.dart';

extension BrightnessExtension on Brightness {
  ///[isDark] returns TRUE if brightness is dark
  bool get isDark => this == Brightness.dark;
}

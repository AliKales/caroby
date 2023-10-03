import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get toBold {
    return copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle get toWhite {
    return copyWith(color: Colors.white);
  }

  TextStyle get toBlack {
    return copyWith(color: Colors.black);
  }
}

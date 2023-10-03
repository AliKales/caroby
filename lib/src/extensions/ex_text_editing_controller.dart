import 'package:flutter/material.dart';

extension TextEditingExtension on TextEditingController {
  ///[textTrim] returns trimmed text of the TextEditingController
  String get textTrim {
    return text.trim();
  }

  ///[isEmpty] checks if TextEditingController is empty
  bool get isEmpty {
    return text.trim() == "";
  }
}

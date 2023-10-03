import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  ///[max] => position.maxScrollExtent
  double get max {
    return position.maxScrollExtent;
  }
}

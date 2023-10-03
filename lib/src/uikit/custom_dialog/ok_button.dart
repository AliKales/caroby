import 'package:flutter/material.dart';

class OKButton extends TextButton {
  OKButton(
    BuildContext context, {
    super.key,
    var val,
    VoidCallback? onPressed,
  }) : super(
          child: const Text("OK"),
          onPressed: onPressed ??
              () {
                Navigator.pop(context, val);
              },
        );
}

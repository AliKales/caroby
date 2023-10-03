import 'package:flutter/material.dart';

///[InkWellNoGlow] is a InkWell but
///highlightColor: Colors.transparent,
///splashColor: Colors.transparent,
class InkWellNoGlow extends StatelessWidget {
  const InkWellNoGlow(
      {super.key,
      required this.child,
      this.onTap,
      this.onDoubleTap,
      this.onLongPress});

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: child,
    );
  }
}

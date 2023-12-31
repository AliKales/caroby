import 'package:caroby/src/extensions/ex_context.dart';
import 'package:flutter/material.dart';

@immutable
final class CustomBottomSheet {
  const CustomBottomSheet._();

  static Future<T?> showCustomModalBottomSheet<T>(
    BuildContext context, {
    Color? backgroundColor,
    required Widget child,
  }) async {
    return await showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              _dividerForBottomSheet(context, backgroundColor: backgroundColor),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }

  //don't change the int values
  static Widget _dividerForBottomSheet(
    BuildContext context, {
    Color? backgroundColor,
  }) {
    return Container(
      width: double.maxFinite,
      height: 20,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Center(
        child: Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.shadow,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

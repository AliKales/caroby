import 'package:caroby/caroby.dart';
import 'package:caroby/src/core/utils.dart';
import 'package:caroby/src/extensions/ex_context.dart';
import 'package:caroby/src/extensions/ex_num.dart';
import 'package:flutter/material.dart';

part 'message_view.dart';

@immutable
final class CustomProgressIndicator {
  const CustomProgressIndicator._();

  static Future showProgressIndicator(BuildContext context) async {
    if (!Utils.isCurrentRoute(context)) return;
    FocusScope.of(context).unfocus();

    await showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: 500.toDuration,
        context: context,
        pageBuilder: (_, __, ___) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        });
  }

  static Future showProgressIndicatorMessage(
    BuildContext context, {
    String? text,
    Widget? child,
  }) async {
    if (!Utils.isCurrentRoute(context)) return;

    FocusScope.of(context).unfocus();

    await showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: 500.toDuration,
      context: context,
      pageBuilder: (_, __, ___) {
        return WillPopScope(
          onWillPop: () async => false,
          child: MessageView(text: text, child: child),
        );
      },
    );
  }
}

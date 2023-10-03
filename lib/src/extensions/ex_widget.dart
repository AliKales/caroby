import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  ///[toEmpty] will return null if [isVisible] is true
  Widget? toEmpty(bool isVisible) {
    if (isVisible) return null;

    return this;
  }

  ///[toVisible] will return SizedBox.shrink() if [isVisible] is true
  Widget toVisible(bool isVisible) {
    if (isVisible) return const SizedBox.shrink();

    return this;
  }

  ///[loading] will return CircularProgressIndicator.adaptive()
  ///if [isLoading] is true
  Widget loading(bool isLoading) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    return this;
  }

  ///[center] => Center(child:this)
  Widget get center => Center(
        child: this,
      );

  ///[centerAlign] => alignment: Alignment.center
  Widget get centerAlign => Align(
        alignment: Alignment.center,
        child: this,
      );

  ///[left] => alignment: Alignment.centerLeft
  Widget get left => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  ///[right] => alignment: Alignment.right
  Widget get right => Align(
        alignment: Alignment.centerRight,
        child: this,
      );

  ///[expanded] => Expanded(child: this)
  Widget get expanded => Expanded(child: this);

  ///[centerColumn] will return a Column and put the widget between
  Widget get centerColumn => Column(
        children: [
          const Spacer(),
          this,
          const Spacer(),
        ],
      );

  ///[centerRow] will return a Row and put the widget between
  Widget get centerRow => Row(
        children: [
          const Spacer(),
          this,
          const Spacer(),
        ],
      );
}

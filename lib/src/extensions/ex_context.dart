import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ///[width] returns => MediaQuery.of(this).size.width
  double get width => MediaQuery.of(this).size.width;

  ///[height] returns => MediaQuery.of(this).size.height
  double get height => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ///[sizedBox] is a SizedBox() but with dynamic sizes.
  ///For example context.sizedBox(height:0.5) will create
  ///a sized box with half of the device's height
  Widget sizedBox({double height = 0, double width = 0}) {
    return SizedBox(
      height: height * this.height,
      width: width * this.width,
    );
  }

  ///[afterBuild] is for calling a method after build is done.
  void afterBuild(Function(Duration) afterBuild) {
    WidgetsBinding.instance.addPostFrameCallback(afterBuild);
  }

  Future<T> navigatorPush<T>(page) async {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => page);
    var object = await Navigator.push(this, route);
    return object;
  }

  void navigatorPushReplacement(page) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => page);
    Navigator.pushReplacement(this, route);
  }

  RelativeRect get toRelativeRec {
    //*get the render box from the context
    final RenderBox renderBox = findRenderObject() as RenderBox;
    //*get the global position, from the widget local position
    final offset = renderBox.localToGlobal(Offset.zero);

    //*calculate the start point in this case, below the button
    final left = offset.dx;
    final top = offset.dy + renderBox.size.height;
    //*The right does not indicates the width
    final right = left + renderBox.size.width;

    return RelativeRect.fromLTRB(left, top, right, 0.0);
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

extension NumExtension on num {
  bool get isOdd => this % 1 == 0;
  bool get isEven => this % 2 == 0;

  ///[symbol] returns num's symbol
  ///1.symbol => "+"
  ///-1.symbol => "-"
  String get symbol => (this >= 0) ? '+' : '-';

  ///[toDynamicHeight] returns a double value calculated by device height
  ///0.5.toDynamicHeight(context) => half of the device height
  double toDynamicHeight(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return height * this;
  }

  ///[toDynamicWidth] returns a double value calculated by device width
  ///0.5.toDynamicWidth(context) => half of the device width
  double toDynamicWidth(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width * this;
  }

  ///[toPercent] returns percentage of the value given with max value
  double toPercent(num max) {
    return 100 * (this / max);
  }

  ///[isBetween] checks if value is between given two numbers
  bool isBetween(num start, num end) {
    return this >= start && this <= end;
  }
}

extension IntExtension on int {
  ///[toDuration] converts int to duration but as in milliseconds
  Duration get toDuration => Duration(milliseconds: this);

  ///[plusOne] returns number + 1
  int get plusOne => this + 1;

  ///[minusOne] returns number - 1
  int get minusOne => this - 1;

  ///[toRandom] generates a random number
  ///Ex: 1.toRandom(5) = 1,2,3,4
  int toRandom(int max) {
    return Random().nextInt(max) + this;
  }

  ///[toDate] converts microsecond to DateTime
  DateTime toDate([bool isUtc = false]) {
    return DateTime.fromMicrosecondsSinceEpoch(this, isUtc: isUtc);
  }

  ///[millisecsToDate] converts microsecond to DateTime
  DateTime millisecsToDate([bool isUtc = false]) {
    return DateTime.fromMillisecondsSinceEpoch(this, isUtc: isEven);
  }
}

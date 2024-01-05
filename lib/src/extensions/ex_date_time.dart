import 'package:flutter/material.dart';

@immutable
final class MAgo {
  final int time;
  final String description;

  const MAgo(this.time, this.description);
}

extension DateTimeExtension on DateTime {
  bool isYesterday([bool isUtc = true]) {
    var now = DateTime.now();
    if (isUtc) {
      now = now.toUtc();
    }

    now = now.subtract(const Duration(days: 1));

    if (now.year == year && now.month == month && now.day == day) {
      return true;
    }

    return false;
  }

  bool isSameDay([bool isUtc = true]) {
    var now = DateTime.now();
    if (isUtc) {
      now = now.toUtc();
    }
    return now.toStringFromDate == toStringFromDate;
  }

  ///[ago] calculates the difference between DateTime.now() and given DateTime
  MAgo get ago {
    Duration d = DateTime.now().difference(this);

    if (d.inSeconds <= 0) {
      return const MAgo(0, "now");
    } else if (d.inSeconds < 60) {
      return MAgo(d.inSeconds, "second");
    } else if (d.inMinutes < 60) {
      return MAgo(d.inMinutes, "minute");
    } else if (d.inHours < 24) {
      return MAgo(d.inHours, "hour");
    } else if (d.inDays == 1) {
      return const MAgo(0, "yesterday");
    } else if (d.inDays < 30) {
      return MAgo(d.inDays, "day");
    } else if (d.inDays < 365) {
      return MAgo((d.inDays / 30).floor(), "month");
    } else {
      return MAgo((d.inDays / 365).floor(), "year");
    }
  }

  String get hhMM {
    return toString().substring(11, 16);
  }

  String get hh {
    return toString().substring(11, 13);
  }

  String get mm {
    return toString().substring(14, 16);
  }

  String get toStringFromDate {
    return "$day/$month/$year";
  }
}

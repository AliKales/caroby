import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class Utils {
  const Utils._();

  ///[measureText] measures the text with its text style
  static Size measureText(String text, TextStyle style,
      {int maxLines = 1, ui.TextDirection direction = ui.TextDirection.ltr}) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: direction)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  ///[loadLocalJson] returns json object from the path that's been sent.
  ///If [values] is not empty, then function will go on the value/values and return them
  static Future loadLocalJson(String path, [List<String>? values]) async {
    if (!path.endsWith(".json")) {
      throw Exception("Only json files are supported!");
    }

    dynamic varToReturn;

    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);

    if (values == null) {
      varToReturn = data;
    } else {
      varToReturn = data;
      for (var i = 0; i < values.length; i++) {
        varToReturn = varToReturn[values[i]];
      }
    }

    return varToReturn;
  }

  static int calculateAge(DateTime birthday) {
    var now = DateTime.now();
    int age = now.year - birthday.year;

    if (now.month < birthday.month) {
      age--;
    } else if (now.month == birthday.month && now.day < birthday.day) {
      age--;
    }

    return age;
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String generateMessageId() {
    var random = Random();
    var timestamp = DateTime.now().millisecondsSinceEpoch;
    var randomString = String.fromCharCodes(List.generate(
        8,
        (index) =>
            random.nextInt(26) + 97)); // Generates a random string of length 8
    return '$timestamp$randomString';
  }

  ///[convertMap] converts Map<dynamic, dynamic> to Map<String, dynamic>
  static Map<String, dynamic> convertMap(Map<dynamic, dynamic> val) {
    var map = Map<String, dynamic>.from(val);
    for (var key in map.keys) {
      if (map[key].runtimeType.toString() == "_Map<Object?, Object?>") {
        map[key] = convertMap(map[key]);
      }
    }

    return map;
  }

  static String formatVideoDuration(int durationInSeconds) {
    int minutes = durationInSeconds ~/ 60;
    int seconds = durationInSeconds % 60;

    String formattedDuration = '$minutes:${seconds.toString().padLeft(2, '0')}';
    return formattedDuration;
  }

  ///[checkIfNull] return true if String is null or equal to "null"
  static bool checkIfNull(String? value) {
    return value == null || value.toLowerCase() == "null";
  }

  static Future<void> changeFileLocation(
    String newPath, {
    String? path,
    Uint8List? uint8list,
  }) async {
    if (path != null) {
      File file = File(path);

      await file.rename(newPath);
    } else {
      await File(newPath).writeAsBytes(uint8list!);
    }
  }

  static String formatBytesToMB(int bytes) {
    if (bytes < 1024 * 1024) {
      double kilobytes = bytes / 1024;
      return '${kilobytes.toStringAsFixed(2)} KB';
    } else {
      double megabytes = bytes / (1024 * 1024);
      return '${megabytes.toStringAsFixed(2)} MB';
    }
  }

  ///[linkToStoragePath] converts a Firebase Storage download link to file's path
  static String linkToStoragePath(String url) {
    try {
      String decodedUrl = Uri.decodeFull(url);

      decodedUrl =
          decodedUrl.replaceRange(0, decodedUrl.indexOf('/o/') + 3, "");

      decodedUrl = decodedUrl.replaceRange(
          decodedUrl.indexOf("?alt"), decodedUrl.length, "");
      return decodedUrl;
    } catch (_) {
      return "";
    }
  }

  static void changeSystemUIColor(Color color) {
    var style = SystemUiOverlayStyle(
      systemNavigationBarColor: color,
    );

    SystemChrome.setSystemUIOverlayStyle(style);
  }

  ///[isCurrentRoute] checks if context is the current route
  static bool isCurrentRoute(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent ?? false;
  }
}

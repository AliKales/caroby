extension StringExtension on String? {
  String get lastLetter {
    if (this == null || this!.isEmpty) {
      return '';
    } else {
      return this!.substring(this!.length - 1);
    }
  }

  String get fileType => this?.split(".").last ?? "";

  Uri get uriParse => Uri.parse(this ?? "");

  int get toInt {
    return int.tryParse(this ?? "") ?? 0;
  }

  double get toDouble {
    return double.tryParse(this ?? "") ?? 0;
  }

  String get toStringFromDate {
    DateTime? dateTime = DateTime.tryParse(this ?? "");

    if (dateTime == null) return "";

    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  String capitalize() {
    if (this == null) return "";
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  String get removeLast {
    if (isEmptyOrNull) return "";
    return this!.substring(0, this!.length - 1);
  }

  DateTime? get toDateTime {
    return DateTime.tryParse(this ?? "");
  }

  bool get checkIfNull {
    return this == null || this!.toLowerCase() == "null";
  }

  bool get isNotEmptyAndNull {
    return this != null && this!.trim() != "";
  }

  bool get isEmptyOrNull {
    return this == null || this?.trim() == "";
  }

  bool get toBool {
    if ((this?.toLowerCase() ?? "true") == "true") {
      return true;
    } else {
      return false;
    }
  }

  ///[toStringg] returns null if is equal to "null" as String or null
  String? get toStringg {
    if (this == null || this == "null") {
      return null;
    }

    return this;
  }
}

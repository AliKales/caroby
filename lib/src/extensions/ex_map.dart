extension MapExtension on Map<dynamic, dynamic>? {
  Map<String, dynamic>? get toStringDynamic {
    if (this == null) return null;

    return Map<String, dynamic>.from(this!);
  }
}

extension ListExtensionNull<E> on List<E>? {
  int indexWhereNull(bool Function(E) test, [int start = 0]) {
    if (this == null) return -1;

    return this!.indexWhere(test, start);
  }

  E? firstWhereOrNull(bool Function(E element) test, {E? Function()? orElse}) {
    if (this == null) return null;
    for (E element in this!) {
      if (test(element)) return element;
    }
    if (orElse != null) return orElse();
    return null;
  }

  bool get isEmptyOrNull {
    if (this == null || this!.isEmpty) return true;
    return false;
  }

  bool get isNotEmptyAndNull {
    if (this != null && this!.isNotEmpty) return true;
    return false;
  }
}

extension ListExtension<E> on List<E> {
  ///[count] => length - 1
  int get count => length - 1;

  E? get firstOrNull => (isEmpty) ? null : first;

  E? get(int index) {
    if (index < length) {
      return this[index];
    }
    return null;
  }

  List<E> sublistSafe(int start, [int? end]) {
    if (isEmpty) return [];
    if (end != null && end > this.count) {
      end = length;
    }
    return sublist(start, end);
  }
}

import 'package:caroby/src/extensions/ex_string.dart';

extension ListExtensionNull<E> on List<E>? {
  E? get firstOrNull {
    if (isEmptyOrNull) return null;
    return this!.first;
  }

  E? get lastOrNull {
    if (isEmptyOrNull) return null;
    return this!.last;
  }

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

  E? get(int? index) {
    if (index != null && index < length) {
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

  List<E> getRangeSafe(int start, [int? end]) {
    end ??= length;
    if (end > length) end = length;

    return getRange(start, end).toList();
  }

  E getElementWrapped(int index) {
    int innerIndex = index.toInt();
    if (innerIndex > count) {
      innerIndex = (innerIndex % length);
    }
    return this[innerIndex];
  }

  bool containsConditional(bool Function(E) test, [int start = 0]) {
    return indexWhere(test, start) != -1;
  }

  Iterable<T> mapIndex<T>(T Function(E e, int index) toElement) {
    int index = -1;

    return map((e) {
      index++;
      return toElement.call(e, index);
    });
  }
}

extension ExtListString on List<String>? {
  List<String>? get capitalize {
    return this?.map((e) => e.capitalize()).toList();
  }

  List<String>? get alphabetical {
    if (this == null) return null;

    this!.sort((a, b) => a.compareTo(b));

    return this;
  }
}

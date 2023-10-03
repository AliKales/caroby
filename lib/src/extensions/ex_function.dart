import 'package:flutter/foundation.dart';

extension FunctionExtension on Function {
  ///[name] returns the name of a function
  ///void foo() => foo
  String get name {
    if (kIsWeb) {
      int firstCha = toString().indexOf("from: ") + 6;
      int secondCha = toString().indexOf("(", firstCha);

      return toString().substring(firstCha, secondCha);
    } else {
      int firstCha = toString().indexOf("'") + 1;
      int secondCha = toString().indexOf("':");

      return toString().substring(firstCha, secondCha);
    }
  }

  ///[path] returns the name of a function but with /
  ///void foo() => /foo
  String get path {
    return "/$name";
  }
}

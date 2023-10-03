extension BoolExtension on bool? {
  ///[isFalse] checks if bool is false
  ///if bool is false then returns true
  ///if bool is null then returns false
  bool get isFalse {
    if (this == null) return false;

    return this == false;
  }

  ///[isTrue] checks if bool is true
  ///if bool is true then returns true
  ///if bool is null then returns false
  bool get isTrue {
    if (this == null) return false;

    return this == true;
  }
}

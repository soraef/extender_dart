extension BoolNullableExtension on bool? {
  bool get isTrue => this == true;
  bool get isFalse => this == false;
  bool get isTrueOrNull => this == true || this == null;
  bool get isFalseOrNull => this == false || this == null;

  bool get nullToFalse => this ?? false;
  bool get nullToTrue => this ?? true;

  T map<T>(
    T Function() trueFunc,
    T Function() falseFunc,
    T Function() nullFunc,
  ) {
    if (this == true) return trueFunc();
    if (this == false) return falseFunc();
    return nullFunc();
  }

  bool? and(bool? other) {
    if (this == false || other == false) return false;
    if (this == null || other == null) return null;
    return true;
  }

  bool? or(bool? other) {
    if (this == true || other == true) return true;
    if (this == null || other == null) return null;
    return false;
  }
}

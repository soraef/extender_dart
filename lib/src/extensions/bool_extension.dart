extension BoolExtension on bool {
  bool get not => !this;
  T map<T>(T Function() trueFunc, T Function() falseFunc) =>
      this ? trueFunc() : falseFunc();
}

extension UniversalExtension<T> on T? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;

  T or(T other) => this ?? other;
  T orElse(T Function() other) => this ?? other();

  T? let(T Function(T it) func) {
    if (this == null) return null;
    return func(this as T);
  }

  T? also(void Function(T it) func) {
    if (this == null) return null;
    func(this as T);
    return this;
  }
}

extension UniversalExtension<T> on T? {
  /// Checks if the object is null.
  /// Usage:
  /// `var name = null;
  ///  if (name.isNull) {
  ///    // handle null case
  ///  }`
  bool get isNull => this == null;

  /// Checks if the object is not null.
  /// Usage:
  /// `var name = 'Alice';
  ///  if (name.isNotNull) {
  ///    // handle non-null case
  ///  }`
  bool get isNotNull => this != null;

  /// Returns the object itself if it's not null; otherwise returns the given [other] object.
  /// Usage:
  /// `var name = null;
  ///  var displayName = name.or('Guest'); // displayName will be 'Guest'`
  T or(T other) => this ?? other;

  /// Returns the object itself if it's not null; otherwise calls the [other] function and returns its result.
  /// Usage:
  /// `var name = null;
  ///  var displayName = name.orElse(() => 'Guest'); // displayName will be 'Guest'`
  T orElse(T Function() other) => this ?? other();

  /// If the object is not null, applies the given [func] to it and returns the result.
  /// Returns null if the object is null.
  /// Usage:
  /// `var number = 42;
  ///  var result = number.let((it) => it * 2); // result will be 84`
  T? let(T Function(T it) func) {
    if (this == null) return null;
    return func(this as T);
  }

  /// If the object is not null, applies the given [func] to it and then returns the object itself.
  /// This is useful for performing actions on the object without breaking the method chain.
  /// Usage example:
  /// `int? number = 42;
  ///  int? sameNumber = number.also(print); // prints 42 and sameNumber will be 42`
  T? also(void Function(T it) func) {
    if (this == null) return null;
    func(this as T);
    return this;
  }
}

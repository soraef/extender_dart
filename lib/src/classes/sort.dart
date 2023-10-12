class SortOrder {
  /// Descending, Newer
  ///
  /// EXAPMLE:
  /// [1, 3, 5, 4, 2].sort(SortOrder.desc)
  ///  => [5, 4, 3, 2, 1]
  static int desc(Comparable a, Comparable b) {
    return b.compareTo(a);
  }

  /// Ascending, Older
  ///
  /// EXAPMLE:
  /// [1, 3, 5, 4, 2].sort(SortOrder.asc)
  /// => [1, 2, 3, 4, 5]
  static int asc(Comparable a, Comparable b) {
    return a.compareTo(b);
  }

  /// Pick a property to sort
  ///
  /// EXAPMLE:
  /// <Map<String, int>>[
  ///    {"age": 20},
  ///    {"age": 30},
  ///    {"age": 10},
  /// ].sort(SortOrder.pick<Map>((e) => e["age"]).asc)
  /// => [{"age": 10}, {"age": 20}, {"age": 30}]
  static SortBy<T> pick<T>(Comparable Function(T) selector) {
    return SortBy(selector);
  }

  /// Nulls first
  ///
  /// EXAPMLE:
  /// [1, 3, null, null, 2].sort(SortOrder.nullsFirst)
  /// => [null, null, 1, 2, 3]
  static int nullsFirst(
    Comparable? a,
    Comparable? b, {
    SortOrderEnum order = SortOrderEnum.asc,
  }) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    return order == SortOrderEnum.asc ? asc(a, b) : desc(a, b);
  }

  /// Nulls last
  ///
  ///
  /// EXAPMLE:
  /// [1, 3, null, null, 2].sort(SortOrder.nullsLast)
  /// => [1, 2, 3, null, null]
  static int nullsLast(
    Comparable? a,
    Comparable? b, {
    SortOrderEnum order = SortOrderEnum.asc,
  }) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return order == SortOrderEnum.asc ? asc(a, b) : desc(a, b);
  }
}

enum SortOrderEnum {
  desc,
  asc,
}

class SortBy<T> {
  final Comparable Function(T item) selector;
  final bool ascendingOrder;

  SortBy(this.selector, {this.ascendingOrder = true});

  int call(T a, T b) {
    final valA = selector(a);
    final valB = selector(b);
    return ascendingOrder
        ? SortOrder.asc(valA, valB)
        : SortOrder.desc(valA, valB);
  }

  SortBy<T> get asc => SortBy<T>(selector, ascendingOrder: true);
  SortBy<T> get desc => SortBy<T>(selector, ascendingOrder: false);
}

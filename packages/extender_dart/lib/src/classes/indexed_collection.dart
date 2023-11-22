/// A collection that allows indexing and navigation through its items.
///
/// The [IndexedCollection] class provides methods to move the cursor to the next or previous item,
/// as well as to move the cursor to a specific index or to the first or last item in the collection.
/// It also allows updating the current item.
///
/// Example usage:
/// ```dart
/// var collection = IndexedCollection(['a', 'b', 'c'], 0);
/// print(collection.currentItem); // Output: a
/// collection = collection.moveNext();
/// print(collection.currentItem); // Output: b
/// collection = collection.moveToLast();
/// print(collection.currentItem); // Output: c
/// collection = collection.updateCurrentItem('d');
/// print(collection.currentItem); // Output: d
/// ```
class IndexedCollection<T> {
  final List<T> items;
  final int cursor;

  /// Creates a new instance of [IndexedCollection] with the specified [items] and [cursor].
  ///
  /// The [cursor] represents the current index in the [items] list.
  /// Throws a [RangeError] if the [cursor] is out of range.
  IndexedCollection(this.items, this.cursor) {
    if (cursor < 0 || cursor >= items.length) {
      throw RangeError.index(cursor, items, 'cursor');
    }
  }

  /// Gets the current item at the cursor position.
  T get currentItem => items[cursor];

  /// Returns `true` if there is a next item after the current cursor position.
  bool canMoveNext() => cursor < items.length - 1;

  /// Moves the cursor to the next item and returns a new [IndexedCollection] instance.
  ///
  /// Throws a [StateError] if there is no next item available.
  IndexedCollection<T> moveNext() {
    if (!canMoveNext()) {
      throw StateError('No next item available');
    }
    return IndexedCollection(items, cursor + 1);
  }

  /// Returns `true` if there is a previous item before the current cursor position.
  bool canMovePrevious() => cursor > 0;

  /// Moves the cursor to the previous item and returns a new [IndexedCollection] instance.
  ///
  /// Throws a [StateError] if there is no previous item available.
  IndexedCollection<T> movePrevious() {
    if (!canMovePrevious()) {
      throw StateError('No previous item available');
    }
    return IndexedCollection(items, cursor - 1);
  }

  /// Moves the cursor to the specified [newIndex] and returns a new [IndexedCollection] instance.
  ///
  /// Throws a [RangeError] if the [newIndex] is out of range.
  IndexedCollection<T> moveTo(int newIndex) {
    if (newIndex < 0 || newIndex >= items.length) {
      throw RangeError.index(newIndex, items, 'newIndex');
    }
    return IndexedCollection(items, newIndex);
  }

  /// Moves the cursor to the first item in the collection and returns a new [IndexedCollection] instance.
  IndexedCollection<T> moveToFirst() {
    return IndexedCollection(items, 0);
  }

  /// Moves the cursor to the last item in the collection and returns a new [IndexedCollection] instance.
  IndexedCollection<T> moveToLast() {
    return IndexedCollection(items, items.length - 1);
  }

  /// Returns the next item after the current cursor position, or `null` if there is no next item.
  T? nextItem() => canMoveNext() ? items[cursor + 1] : null;

  /// Returns the previous item before the current cursor position, or `null` if there is no previous item.
  T? previousItem() => canMovePrevious() ? items[cursor - 1] : null;

  /// Updates the current item at the cursor position with the specified [newItem] and returns a new [IndexedCollection] instance.
  IndexedCollection<T> updateCurrentItem(T newItem) {
    List<T> updatedItems = List<T>.from(items);
    updatedItems[cursor] = newItem;
    return IndexedCollection(updatedItems, cursor);
  }

  // Check if the cursor is at the last item
  bool get isLast => cursor == items.length - 1;

  // Check if the cursor is at the first item
  bool get isFirst => cursor == 0;

  @override
  String toString() => 'IndexedCollection(cursor: $cursor, items: $items)';
}

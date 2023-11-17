extension ListExtension<T> on List<T> {
  /// Adds the specified [element] to the end of this list and returns a new list.
  ///
  /// The returned list is a copy of this list with the [element] added at the end.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3];
  /// List<int> newNumbers = numbers.addWith(4);
  /// print(newNumbers); // Output: [1, 2, 3, 4]
  /// ```
  List<T> addWith(T element) {
    return List.from(this)..add(element);
  }

  /// Removes the first occurrence of the specified [element] from the list.
  /// Returns a new list with the element removed.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// List<int> updatedNumbers = numbers.removeWith(3);
  /// print(updatedNumbers); // Output: [1, 2, 4, 5]
  /// ```
  List<T> removeWith(T element) {
    return List.from(this)..remove(element);
  }

  /// Inserts the specified [element] at the given [index] in the list.
  /// Returns a new list with the element inserted.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4];
  /// List<int> newNumbers = numbers.insertWith(2, 5);
  /// print(newNumbers); // Output: [1, 2, 5, 3, 4]
  /// ```
  List<T> insertWith(int index, T element) {
    return List.from(this)..insert(index, element);
  }

  /// Removes the element at the specified [index] from the list and returns a new list.
  ///
  /// The original list remains unchanged.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// List<int> newNumbers = numbers.removeAtWith(2);
  /// print(newNumbers); // Output: [1, 2, 4, 5]
  /// ```
  List<T> removeAtWith(int index) {
    return List.from(this)..removeAt(index);
  }

  /// Removes duplicates from the list based on a key generated from each element.
  /// [keyOf] - A function that generates a unique key for each element.
  List<T> uniqueBy<K>(K Function(T) keyOf) {
    var uniqueMap = <K, T>{};

    for (var element in this) {
      // Get the unique key for the element.
      var key = keyOf(element);
      // If this key is not already in the map, add the element.
      if (!uniqueMap.containsKey(key)) {
        uniqueMap[key] = element;
      }
    }

    // Return the list of elements with duplicates removed.
    return uniqueMap.values.toList();
  }

  /// Splits the list into chunks of the specified `size` and returns a new list
  /// containing each chunk as a list. The original list remains unmodified.
  /// The last chunk may have fewer elements if there are not enough elements
  /// left in the list to make a full chunk of the specified `size`.
  ///
  /// `size` must be a positive integer greater than zero.
  ///
  /// ## Example:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// List<List<int>> chunked = numbers.chunk(2);
  /// print(chunked); // Output: [[1, 2], [3, 4], [5]]
  /// ```
  ///
  /// - Parameters:
  ///   - `size`: The number of elements each chunk should have.
  /// - Returns: A new list of lists of type `T`, where each sublist contains
  ///   `size` number of elements, except possibly the last.
  List<List<T>> chunk(int size) {
    List<List<T>> chunks = [];
    for (var i = 0; i < length; i += size) {
      var end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }
}

extension ListFutureExtension<T> on List<Future<T>> {
  /// Waits for all the futures in the list to complete and returns a new Future
  /// that completes with a list of the values produced by the futures.
  ///
  /// Returns a Future that completes with a list of the values produced by the
  /// futures in the original list, in the same order as the original list.
  ///
  /// Example usage:
  /// ```dart
  /// List<Future<int>> futures = [Future.value(1), Future.value(2), Future.value(3)];
  /// List<int> results = await futures.wait();
  /// print(results); // Output: [1, 2, 3]
  /// ```
  Future<List<T>> wait() {
    return Future.wait(this);
  }
}

extension ListListExtension<T> on List<List<T>> {
  /// Flattens the list by concatenating all nested lists into a single list.
  /// Returns a new list with all elements flattened.
  ///
  /// Example:
  /// ```dart
  /// List<List<int>> nestedList = [[1, 2], [3, 4], [5, 6]];
  /// List<int> flattenedList = nestedList.flatten();
  /// print(flattenedList); // Output: [1, 2, 3, 4, 5, 6]
  /// ```
  List<T> flatten() {
    return fold([], (prev, e) => prev..addAll(e));
  }
}

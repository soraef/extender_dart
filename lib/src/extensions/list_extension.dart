extension ListExtension<T> on List<T> {
  List<T> addWith(T element) {
    return List.from(this)..add(element);
  }

  List<T> removeWith(T element) {
    return List.from(this)..remove(element);
  }

  List<T> insertWith(int index, T element) {
    return List.from(this)..insert(index, element);
  }

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
}

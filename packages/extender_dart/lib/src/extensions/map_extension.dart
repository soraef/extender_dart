extension MapExtension<K, V> on Map<K, V> {
  /// Adds a key-value pair to the map and returns a new map.
  /// If the key already exists, the value will be updated.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int> map = {'a': 1, 'b': 2};
  /// Map<String, int> newMap = map.addWith('c', 3);
  /// print(newMap); // Output: {'a': 1, 'b': 2, 'c': 3}
  /// ```
  Map<K, V> addWith(K key, V value) {
    return Map.from(this)..[key] = value;
  }

  /// Adds a map entry to the map and returns a new map.
  /// If the key of the entry already exists, the value will be updated.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int> map = {'a': 1, 'b': 2};
  /// MapEntry<String, int> entry = MapEntry('c', 3);
  /// Map<String, int> newMap = map.addEntryWith(entry);
  /// print(newMap); // Output: {'a': 1, 'b': 2, 'c': 3}
  /// ```
  Map<K, V> addEntryWith(MapEntry<K, V> entry) {
    return Map.from(this)..[entry.key] = entry.value;
  }

  /// Removes a key-value pair from the map and returns a new map.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int> map = {'a': 1, 'b': 2};
  /// Map<String, int> newMap = map.removeWith('a');
  /// print(newMap); // Output: {'b': 2}
  /// ```
  Map<K, V> removeWith(K key) {
    return Map.from(this)..remove(key);
  }

  /// Updates the value of a key in the map and returns a new map.
  ///
  /// Example:
  /// ```dart
  /// Map<String, int> map = {'a': 1, 'b': 2};
  /// Map<String, int> newMap = map.updateWith('a', (value) => value + 1);
  /// print(newMap); // Output: {'a': 2, 'b': 2}
  /// ```
  Map<K, V> updateWith(K key, V Function(V) update) {
    return Map.from(this)..update(key, update);
  }
}

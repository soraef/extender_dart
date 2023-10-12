extension MapExtension<K, V> on Map<K, V> {
  Map<K, V> addWith(K key, V value) {
    return Map.from(this)..[key] = value;
  }

  Map<K, V> addEntryWith(MapEntry<K, V> entry) {
    return Map.from(this)..[entry.key] = entry.value;
  }

  Map<K, V> removeWith(K key) {
    return Map.from(this)..remove(key);
  }

  Map<K, V> updateWith(K key, V Function(V) update) {
    return Map.from(this)..update(key, update);
  }
}

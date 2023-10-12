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
}

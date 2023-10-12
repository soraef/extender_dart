extension StringNullableExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNullOrWhitespace => this == null || this!.trim().isEmpty;

  String orEmpty(String defaultValue) => isNullOrEmpty ? defaultValue : this!;
  String orWhitespace(String defaultValue) =>
      isNullOrWhitespace ? defaultValue : this!;
}

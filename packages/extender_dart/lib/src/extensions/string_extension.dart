extension StringExtension on String {
  /// Parses the string as an integer and returns the result.
  /// If the string is not a valid integer, returns `null`.
  int? toIntOrNull({int? radix}) {
    // Try to parse the string as an integer.
    return int.tryParse(this, radix: radix);
  }

  bool get isInt {
    // Try to parse the string as an integer.
    return int.tryParse(this) != null;
  }

  /// Parses the string as a double and returns the result.
  double? toDoubleOrNull() {
    // Try to parse the string as a double.
    return double.tryParse(this);
  }

  bool get isDouble {
    // Try to parse the string as a double.
    return double.tryParse(this) != null;
  }

  bool? toBooleanOrNull() {
    switch (toLowerCase()) {
      case 'true':
        return true;
      case 'false':
        return false;
      default:
        return null;
    }
  }

  bool get isBoolean {
    return toBooleanOrNull() != null;
  }

  DateTime? toDateTimeOrNull() {
    // Try to parse the string as a DateTime.
    return DateTime.tryParse(this);
  }

  bool get isDateTime {
    // Try to parse the string as a DateTime.
    return DateTime.tryParse(this) != null;
  }

  Uri? toUriOrNull() {
    // Try to parse the string as a Uri.
    return Uri.tryParse(this)!;
  }

  bool get isUri {
    // Try to parse the string as a Uri.
    return Uri.tryParse(this) != null;
  }
}

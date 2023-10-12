extension IntExtension on int {
  /// Returns a [Duration] representing the number of milliseconds
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get m => Duration(milliseconds: this);

  /// Returns a [Duration] representing the number of seconds
  Duration get seconds => Duration(seconds: this);

  /// Returns a [Duration] representing the number of minutes
  Duration get minutes => Duration(minutes: this);

  /// Returns a [Duration] representing the number of hours
  Duration get hours => Duration(hours: this);

  /// Returns a [Duration] representing the number of days
  Duration get days => Duration(days: this);

  /// Returns a [Duration] representing the number of weeks
  Duration get weeks => Duration(days: this * 7);
}

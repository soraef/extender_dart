import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Formats the DateTime object using the specified pattern and locale.
  ///
  /// The [pattern] parameter specifies the format pattern to use.
  /// The [locale] parameter specifies the locale to use for formatting.
  ///
  /// Returns the formatted string representation of the DateTime object.
  String format(String pattern, [String? locale]) {
    return DateFormat(pattern, locale).format(this);
  }

  /// Checks if the DateTime object represents today's date.
  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  /// Checks if the DateTime object represents yesterday's date.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDayAs(yesterday);
  }

  /// Checks if the DateTime object represents tomorrow's date.
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return isSameDayAs(tomorrow);
  }

  /// Checks if the DateTime object represents a weekend day (Saturday or Sunday).
  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  /// Checks if the DateTime object represents a weekday (Monday to Friday).
  bool get isWeekday {
    return !isWeekend;
  }

  /// Gets the DateTime object representing the start of the day.
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Gets the DateTime object representing the end of the day.
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  /// Adds the specified number of days to the DateTime object.
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// Subtracts the specified number of days from the DateTime object.
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  /// Calculates the difference in days between the DateTime object and the specified DateTime.
  int differenceInDays(DateTime other) {
    return difference(other).inDays;
  }

  /// Checks if the DateTime object represents the same day as the specified DateTime.
  bool isSameDayAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Checks if the DateTime object represents the same month as the specified DateTime.
  bool isSameMonthAs(DateTime other) {
    return year == other.year && month == other.month;
  }

  /// Gets the number of days in the month of the DateTime object.
  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  /// Gets the DateTime object representing the first day of the month.
  DateTime get firstDayOfMonth {
    return DateTime(year, month, 1);
  }

  /// Gets the DateTime object representing the last day of the month.
  DateTime get lastDayOfMonth {
    return DateTime(year, month + 1, 0);
  }

  /// Gets the DateTime object representing the next month.
  DateTime get nextMonth {
    return DateTime(year, month + 1, day);
  }

  /// Gets the DateTime object representing the previous month.
  DateTime get previousMonth {
    return DateTime(year, month - 1, day);
  }

  /// Checks if the year of the DateTime object is a leap year.
  bool get isLeapYear {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }

  /// Gets the day of the year for the DateTime object.
  int get dayOfYear {
    return difference(DateTime(year, 1, 1)).inDays + 1;
  }

  /// Checks if the DateTime object represents the same year as the specified DateTime.
  bool isSameYearAs(DateTime other) {
    return year == other.year;
  }

  /// Gets the age in years based on the DateTime object and the current date.
  int get age {
    final currentDate = DateTime.now();
    int age = currentDate.year - year;
    if (currentDate.month < month ||
        (currentDate.month == month && currentDate.day < day)) {
      age--;
    }
    return age;
  }

  /// Checks if the DateTime object is between the specified start and end DateTime.
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  /// Gets the DateTime object representing the start of the week.
  ///
  /// The [startDayOfWeek] parameter specifies the starting day of the week (default is Monday).
  DateTime atStartOfWeek([int startDayOfWeek = DateTime.monday]) {
    final difference = weekday - startDayOfWeek;
    return subtract(Duration(days: difference));
  }

  /// Gets the DateTime object representing the end of the week.
  ///
  /// The [endDayOfWeek] parameter specifies the ending day of the week (default is Sunday).
  DateTime atEndOfWeek([int endDayOfWeek = DateTime.sunday]) {
    final difference = endDayOfWeek - weekday;
    return add(Duration(days: difference));
  }

  /// Checks if the DateTime object represents a future date.
  bool get isFuture {
    return isAfter(DateTime.now());
  }

  /// Checks if the DateTime object represents a past date.
  bool get isPast {
    return isBefore(DateTime.now());
  }

  /// Gets the DateTime object representing the next day.
  DateTime get nextDay {
    return add(const Duration(days: 1));
  }

  /// Gets the DateTime object representing the previous day.
  DateTime get previousDay {
    return subtract(const Duration(days: 1));
  }

  /// Gets the DateTime object representing the start of the month.
  DateTime get startOfMonth {
    return DateTime(year, month);
  }

  /// Gets the DateTime object representing the end of the month.
  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0, 23, 59, 59);
  }

  /// Gets the DateTime object representing the start of the year.
  DateTime get startOfYear {
    return DateTime(year);
  }

  /// Gets the DateTime object representing the end of the year.
  DateTime get endOfYear {
    return DateTime(year + 1, 1, 0, 23, 59, 59);
  }

  /// Checks if the DateTime object is the same as or before the specified DateTime.
  bool isSameOrBefore(DateTime other) {
    return isAtSameMomentAs(other) || isBefore(other);
  }

  /// Checks if the DateTime object is the same as or after the specified DateTime.
  bool isSameOrAfter(DateTime other) {
    return isAtSameMomentAs(other) || isAfter(other);
  }

  /// Checks if the DateTime object is between the specified start and end DateTime (inclusive).
  bool isBetweenInclusive(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end) ||
        isAtSameMomentAs(start) ||
        isAtSameMomentAs(end);
  }

  /// Gets the DateTime object representing the closest weekday to the specified weekday.
  DateTime closestWeekday(int weekday) {
    final daysDifference = (weekday - this.weekday) % 7;
    return add(Duration(days: daysDifference));
  }

  /// Gets the DateTime object representing the farthest weekday from the specified weekday.
  DateTime farthestWeekday(int weekday) {
    final daysDifference = (weekday - this.weekday + 7) % 7;
    return add(Duration(days: daysDifference == 0 ? 7 : daysDifference));
  }

  /// Formats the DateTime object using custom formatting options for Japanese.
  ///
  /// The [dateOnly] parameter specifies whether to include only the date part.
  /// The [timeOnly] parameter specifies whether to include only the time part.
  ///
  /// Returns the formatted string representation of the DateTime object.
  String formatJapanese({bool dateOnly = false, bool timeOnly = false}) {
    return customFormat(
      yearSuffix: '年',
      monthSuffix: '月',
      daySuffix: '日',
      hourSuffix: '時',
      minuteSuffix: '分',
      secondSuffix: '秒',
      dateSeparator: '',
      timeSeparator: '',
      dateTimeSeparator: ' ',
      dateOnly: dateOnly,
      timeOnly: timeOnly,
    );
  }

  /// Formats the DateTime object using custom formatting options.
  ///
  /// The [dateSeparator] parameter specifies the separator between date components.
  /// The [timeSeparator] parameter specifies the separator between time components.
  /// The [dateTimeSeparator] parameter specifies the separator between date and time.
  /// The [yearSuffix] parameter specifies the suffix for the year component.
  /// The [monthSuffix] parameter specifies the suffix for the month component.
  /// The [daySuffix] parameter specifies the suffix for the day component.
  /// The [hourSuffix] parameter specifies the suffix for the hour component.
  /// The [minuteSuffix] parameter specifies the suffix for the minute component.
  /// The [secondSuffix] parameter specifies the suffix for the second component.
  /// The [dateOnly] parameter specifies whether to include only the date part.
  /// The [timeOnly] parameter specifies whether to include only the time part.
  ///
  /// Returns the formatted string representation of the DateTime object.
  String customFormat({
    String dateSeparator = '/',
    String timeSeparator = ':',
    String dateTimeSeparator = ' ',
    String yearSuffix = '',
    String monthSuffix = '',
    String daySuffix = '',
    String hourSuffix = '',
    String minuteSuffix = '',
    String secondSuffix = '',
    bool dateOnly = false,
    bool timeOnly = false,
  }) {
    final year = this.year.toString().padLeft(4, '0');
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    final second = this.second.toString().padLeft(2, '0');

    final formattedDate =
        '$year$dateSeparator$month$monthSuffix$dateSeparator$day$daySuffix';
    final formattedTime =
        '$hour$hourSuffix$timeSeparator$minute$minuteSuffix$timeSeparator$second$secondSuffix';

    if (dateOnly) {
      return formattedDate;
    }

    if (timeOnly) {
      return formattedTime;
    }

    return '$formattedDate$dateTimeSeparator$formattedTime';
  }
}

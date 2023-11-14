import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format(String pattern, [String? locale]) {
    return DateFormat(pattern, locale).format(this);
  }

  // Determine if the DateTime object is today's date.
  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  // Determine if the DateTime object is yesterday's date.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDayAs(yesterday);
  }

  // Determine if the DateTime object is tomorrow's date.
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return isSameDayAs(tomorrow);
  }

  // Determine if the DateTime object is a weekend (usually Saturday or Sunday).
  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  // Determine if the DateTime object is a weekday.
  bool get isWeekday {
    return !isWeekend;
  }

  // Sets the time of the DateTime object to 00:00:00 and returns a new DateTime object with the date unchanged.
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  // Sets the time of the DateTime object to 23:59:59 and returns a new DateTime object with the date unchanged.
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  // Adds the specified number of days to the DateTime object.
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  // Subtracts the specified number of days from the DateTime object.
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  // Calculates the difference in days from other DateTime objects.
  int differenceInDays(DateTime other) {
    return difference(other).inDays;
  }

  // Determines if it is the same day as another DateTime object.
  bool isSameDayAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  // Determines if it is the same month as another DateTime object.
  bool isSameMonthAs(DateTime other) {
    return year == other.year && month == other.month;
  }

  // Returns the number of days in the month.
  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  // Returns the first day of the month.
  DateTime get firstDayOfMonth {
    return DateTime(year, month, 1);
  }

  // Returns the last day of the month.
  DateTime get lastDayOfMonth {
    return DateTime(year, month + 1, 0);
  }

  // Returns the same day of the following month.
  DateTime get nextMonth {
    return DateTime(year, month + 1, day);
  }

  // Returns the same day of the previous month.
  DateTime get previousMonth {
    return DateTime(year, month - 1, day);
  }

  // Determines if it is a leap year.
  bool get isLeapYear {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }

  // Returns the number of days of the year.
  int get dayOfYear {
    return difference(DateTime(year, 1, 1)).inDays + 1;
  }

  // Determines if it is the same year as another DateTime object.
  bool isSameYearAs(DateTime other) {
    return year == other.year;
  }

  // Calculates the age from a given date.
  int get age {
    final currentDate = DateTime.now();
    int age = currentDate.year - year;
    if (currentDate.month < month ||
        (currentDate.month == month && currentDate.day < day)) {
      age--;
    }
    return age;
  }

  // Determines if it is between two DateTime objects.
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  // Returns the first day of the week (usually Monday).
  DateTime atStartOfWeek([int startDayOfWeek = DateTime.monday]) {
    final difference = weekday - startDayOfWeek;
    return subtract(Duration(days: difference));
  }

  // Returns the last day of the week (usually Sunday).
  DateTime atEndOfWeek([int endDayOfWeek = DateTime.sunday]) {
    final difference = endDayOfWeek - weekday;
    return add(Duration(days: difference));
  }

  // Determines if it is a future date.
  bool get isFuture {
    return isAfter(DateTime.now());
  }

  // Determine if the date is in the past.
  bool get isPast {
    return isBefore(DateTime.now());
  }

  // Returns the same time the next day.
  DateTime get nextDay {
    return add(const Duration(days: 1));
  }

  // Returns the same time of the previous day.
  DateTime get previousDay {
    return subtract(const Duration(days: 1));
  }

  // Returns 00:00:00 of the beginning of that month.
  DateTime get startOfMonth {
    return DateTime(year, month);
  }

  // Returns 23:59:59 at the end of that month.
  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0, 23, 59, 59);
  }

  // Returns 00:00:00 of the beginning of the year.
  DateTime get startOfYear {
    return DateTime(year);
  }

  // Returns 23:59:59 at the end of that year.
  DateTime get endOfYear {
    return DateTime(year + 1, 1, 0, 23, 59, 59);
  }

  // Determines if it is the same as or earlier than another DateTime object.
  bool isSameOrBefore(DateTime other) {
    return isAtSameMomentAs(other) || isBefore(other);
  }

  // Determines if it is the same as or later than another DateTime object.
  bool isSameOrAfter(DateTime other) {
    return isAtSameMomentAs(other) || isAfter(other);
  }

  // Determines if it is between two DateTime objects (including endpoints).
  bool isBetweenInclusive(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end) ||
        isAtSameMomentAs(start) ||
        isAtSameMomentAs(end);
  }

  // Returns the nearest specified day of the week.
  DateTime closestWeekday(int weekday) {
    final daysDifference = (weekday - this.weekday) % 7;
    return add(Duration(days: daysDifference));
  }

  // Returns the furthest specified day of the week.
  DateTime farthestWeekday(int weekday) {
    final daysDifference = (weekday - this.weekday + 7) % 7;
    return add(Duration(days: daysDifference == 0 ? 7 : daysDifference));
  }

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
}

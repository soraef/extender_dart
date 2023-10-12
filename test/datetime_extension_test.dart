import 'package:extender_dart/extender_dart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTimeExtension', () {
    test('format', () {
      final date = DateTime(2023, 9, 25);
      expect(date.format('yyyy-MM-dd'), '2023-09-25');
    });

    test('isToday', () {
      expect(DateTime.now().isToday, isTrue);
      expect(DateTime.now().add(const Duration(days: 1)).isToday, isFalse);
    });

    test('isYesterday', () {
      expect(DateTime.now().subtract(Duration(days: 1)).isYesterday, isTrue);
      expect(DateTime.now().isYesterday, isFalse);
    });

    test('isTomorrow', () {
      expect(DateTime.now().add(Duration(days: 1)).isTomorrow, isTrue);
      expect(DateTime.now().isTomorrow, isFalse);
    });

    test('isWeekend', () {
      expect(DateTime(2023, 9, 23).isWeekend, isTrue); // Saturday
      expect(DateTime(2023, 9, 25).isWeekend, isFalse); // Monday
    });

    test('isWeekday', () {
      expect(DateTime(2023, 9, 25).isWeekday, isTrue); // Monday
      expect(DateTime(2023, 9, 23).isWeekday, isFalse); // Saturday
    });

    test('startOfDay', () {
      final startOfDay = DateTime(2023, 9, 25).startOfDay;
      expect(startOfDay, DateTime(2023, 9, 25, 0, 0, 0));
    });

    test('endOfDay', () {
      final endOfDay = DateTime(2023, 9, 25).endOfDay;
      expect(endOfDay, DateTime(2023, 9, 25, 23, 59, 59));
    });

    test('addDays and subtractDays', () {
      final date = DateTime(2023, 9, 25);
      expect(date.addDays(1), DateTime(2023, 9, 26));
      expect(date.subtractDays(1), DateTime(2023, 9, 24));
    });

    test('differenceInDays', () {
      final date1 = DateTime(2023, 9, 25);
      final date2 = DateTime(2023, 9, 28);
      expect(date1.differenceInDays(date2), -3);
      expect(date2.differenceInDays(date1), 3);
    });

    test('isSameDayAs', () {
      final date1 = DateTime(2023, 9, 25);
      final date2 = DateTime(2023, 9, 25);
      final date3 = DateTime(2023, 9, 26);
      expect(date1.isSameDayAs(date2), isTrue);
      expect(date1.isSameDayAs(date3), isFalse);
    });

    test('isSameMonthAs', () {
      final date1 = DateTime(2023, 9, 25);
      final date2 = DateTime(2023, 9, 26);
      final date3 = DateTime(2023, 10, 25);
      expect(date1.isSameMonthAs(date2), isTrue);
      expect(date1.isSameMonthAs(date3), isFalse);
    });

    test('daysInMonth', () {
      expect(DateTime(2023, 1, 25).daysInMonth, 31); // January
      expect(DateTime(2023, 2, 25).daysInMonth, 28); // February (non-leap year)
      expect(DateTime(2024, 2, 25).daysInMonth, 29); // February (leap year)
    });

    test('firstDayOfMonth and lastDayOfMonth', () {
      final date = DateTime(2023, 9, 25);
      expect(date.firstDayOfMonth, DateTime(2023, 9, 1));
      expect(date.lastDayOfMonth, DateTime(2023, 9, 30));
    });

    test('nextMonth and previousMonth', () {
      final date = DateTime(2023, 9, 25);
      expect(date.nextMonth, DateTime(2023, 10, 25));
      expect(date.previousMonth, DateTime(2023, 8, 25));
    });

    test('isLeapYear', () {
      expect(DateTime(2023, 9, 25).isLeapYear, isFalse); // Non-leap year
      expect(DateTime(2024, 9, 25).isLeapYear, isTrue); // Leap year
    });

    test('dayOfYear', () {
      final date = DateTime(2023, 1, 1);
      expect(date.dayOfYear, 1);
      expect(date.add(Duration(days: 1)).dayOfYear, 2);
    });

    test('isSameYearAs', () {
      final date1 = DateTime(2023, 9, 25);
      final date2 = DateTime(2023, 10, 25);
      final date3 = DateTime(2024, 9, 25);
      expect(date1.isSameYearAs(date2), isTrue);
      expect(date1.isSameYearAs(date3), isFalse);
    });

    test('age', () {
      final birthDate = DateTime(2000, 9, 25);
      final currentDate = DateTime(2023, 9, 25);
      expect(birthDate.age, currentDate.year - birthDate.year);
    });

    test('isBetween', () {
      final date = DateTime(2023, 9, 25);
      final start = DateTime(2023, 9, 24);
      final end = DateTime(2023, 9, 26);
      expect(date.isBetween(start, end), isTrue);
      expect(date.isBetween(end, start), isFalse);
    });

    test('atStartOfWeek and atEndOfWeek', () {
      final date = DateTime(2023, 9, 27); // Wednesday
      expect(date.atStartOfWeek(), DateTime(2023, 9, 25)); // Monday
      expect(date.atEndOfWeek(), DateTime(2023, 10, 1)); // Sunday
    });

    test('isFuture and isPast', () {
      final now = DateTime.now();
      final futureDate = now.add(Duration(seconds: 1));
      final pastDate = now.subtract(Duration(seconds: 1));
      expect(futureDate.isFuture, isTrue);
      expect(pastDate.isPast, isTrue);
    });

    test('nextDay and previousDay', () {
      final date = DateTime(2023, 9, 25);
      expect(date.nextDay, DateTime(2023, 9, 26));
      expect(date.previousDay, DateTime(2023, 9, 24));
    });

    test('startOfMonth and endOfMonth', () {
      final date = DateTime(2023, 9, 25);
      expect(date.startOfMonth, DateTime(2023, 9, 1));
      expect(date.endOfMonth, DateTime(2023, 9, 30, 23, 59, 59));
    });

    test('startOfYear and endOfYear', () {
      final date = DateTime(2023, 9, 25);
      expect(date.startOfYear, DateTime(2023, 1, 1));
      expect(date.endOfYear, DateTime(2023, 12, 31, 23, 59, 59));
    });

    test('isSameOrBefore and isSameOrAfter', () {
      final date1 = DateTime(2023, 9, 25);
      final date2 = DateTime(2023, 9, 26);
      expect(date1.isSameOrBefore(date2), isTrue);
      expect(date2.isSameOrAfter(date1), isTrue);
    });

    test('isBetweenInclusive', () {
      final date = DateTime(2023, 9, 25);
      final start = DateTime(2023, 9, 25);
      final end = DateTime(2023, 9, 26);
      expect(date.isBetweenInclusive(start, end), isTrue);
    });
  });
}

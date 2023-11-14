extension NumExtension on num {
  bool isBetweenInclusive(num min, num max) => this >= min && this <= max;
  bool isBetweenExclusive(num min, num max) => this > min && this < max;
}

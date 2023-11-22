import 'dart:async';

extension DurationExtension on Duration {
  Future<dynamic> delayed([FutureOr<dynamic> Function()? computation]) async {
    return await Future.delayed(this, computation);
  }
}

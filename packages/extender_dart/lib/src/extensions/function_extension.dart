extension Function0<R> on R Function() {
  R log() {
    return this();
  }
}

extension Function1<A, R> on R Function(A) {
  R log(A a) {
    return this(a);
  }
}

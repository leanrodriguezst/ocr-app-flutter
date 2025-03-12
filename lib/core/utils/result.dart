class Result<T, E> {
  final T? value;
  final E? error;

  Result({this.value, this.error});

  bool get isSuccess => value != null;
  bool get isFailure => error != null;
}

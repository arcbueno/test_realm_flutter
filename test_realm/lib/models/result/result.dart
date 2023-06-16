class Result<T> {
  late final String? error;
  late final T? value;
  bool get success => error == null;

  Result({this.error, this.value});
}

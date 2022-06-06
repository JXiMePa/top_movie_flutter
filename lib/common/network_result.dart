class Result<R, L> {
  final R? success;
  final L? error;

  Result({this.success, this.error});
}

class NetworkError {
  final String? message;

  NetworkError({this.message});
}

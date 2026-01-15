enum Status { Loading, Success, Failed }

class Result<T> {
  final Status status;
  final T? data;
  final String? error;

  Result({required this.status, this.data, this.error});

  factory Result.loading() => Result(status: Status.Loading);
  factory Result.success(T data) => Result(status: Status.Success, data: data);
  factory Result.failed(String error) =>
      Result(status: Status.Failed, error: error);
}

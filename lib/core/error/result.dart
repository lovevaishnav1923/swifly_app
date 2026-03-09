import 'failure.dart';

class Result<T> {
  final T? data;
  final Failure? failure;

  Result.success([this.data]) : failure = null;
  Result.error(this.failure) : data = null;

  bool get isSuccess => failure == null;
  bool get isError => failure != null;
}

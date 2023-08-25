import '../../errors/app_exception.dart';

sealed class ApiResponse<T> {}

class ApiResponseSuccess<T> implements ApiResponse<T> {
  const ApiResponseSuccess(this.data);
  final T data;
}

class ApiResponseError<T> implements ApiResponse<T> {
  const ApiResponseError(this.ex);
  final AppException ex;
}

extension ApiResponseExtension<T> on ApiResponse<T> {
  T? get data => switch (this) {
        ApiResponseSuccess(data: T data) => data,
        _ => null,
      };
}

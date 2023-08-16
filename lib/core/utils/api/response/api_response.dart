import 'package:freezed_annotation/freezed_annotation.dart';

import '../../errors/app_exception.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const ApiResponse._();
  const factory ApiResponse.success(
    T data, {
    @Default({}) Map<String, dynamic> headerResponse,
  }) = _ApiSuccess<T>;
  const factory ApiResponse.error(AppException exception) = _ApiError;

  T? get data => whenOrNull(
        success: (data, headerResponse) => data,
      );
}

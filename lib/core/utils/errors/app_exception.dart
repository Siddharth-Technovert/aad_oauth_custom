import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_exception.dart';
import 'cache_exception.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const AppException._();
  const factory AppException.networkError() = _NetworkError;
  const factory AppException.cacheError(CacheException error) = _CacheError;
  const factory AppException.serializationError() = _SerializationError;
  const factory AppException.apiError(ApiException error) = _ApiError;
  const factory AppException.unknownError(dynamic error) = _UnknownError;

  String get msg => when(
        networkError: () => "Unable to connect to internet",
        cacheError: (ex) => "Cache error: ${ex.msg}",
        serializationError: () => "Unable to deserialize data",
        apiError: (ex) => "ApiError ${ex.msg}",
        unknownError: (ex) => "unknownError $ex",
      );
}

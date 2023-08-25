import '../api/response/api_error_response.dart';
import 'api_exception.dart';
import 'cache_exception.dart';

sealed class AppException implements Exception {}

class AppExceptionNetworkError implements AppException {
  const AppExceptionNetworkError();
}

class AppExceptionCacheError implements AppException {
  const AppExceptionCacheError(this.cacheException);
  final CacheException cacheException;
}

class AppExceptionSerializationError implements AppException {
  const AppExceptionSerializationError();
}

class AppExceptionApiError implements AppException {
  const AppExceptionApiError(this.apiErrorResponse, this.apiException);
  final ApiErrorResponse? apiErrorResponse;
  final ApiException apiException;
}

class AppExceptionUnknownError implements AppException {
  const AppExceptionUnknownError(this.error);
  final dynamic error;
}

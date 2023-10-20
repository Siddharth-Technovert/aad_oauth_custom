import 'package:flutter/widgets.dart';

import '../api/response/api_error_response.dart';
import '../extensions/context_extension.dart';
import 'api_exception.dart';
import 'cache_exception.dart';

sealed class AppException implements Exception {
  const AppException();
}

final class AppExceptionNetworkError extends AppException {
  const AppExceptionNetworkError();
}

final class AppExceptionCacheError extends AppException {
  const AppExceptionCacheError(this.cacheException);
  final CacheException cacheException;
}

final class AppExceptionSerializationError extends AppException {
  const AppExceptionSerializationError();
}

final class AppExceptionApiError extends AppException {
  const AppExceptionApiError(this.apiErrorResponse, this.apiException);
  final ApiErrorResponse? apiErrorResponse;
  final ApiException apiException;
}

final class AppExceptionUnknownError extends AppException {
  const AppExceptionUnknownError(this.error);
  final dynamic error;
}

extension AppExceptionExtension on AppException {
  String? msg(BuildContext context) => switch (this) {
        AppExceptionNetworkError() => context.appLoc.networkError,
        AppExceptionCacheError(cacheException: var ex) =>
          "${context.appLoc.cacheError}: ${ex.msg(context)}",
        AppExceptionSerializationError() => context.appLoc.serializationError,
        AppExceptionApiError(apiErrorResponse: var _, apiException: var ex) =>
          "${context.appLoc.apiError}: ${ex.msg(context)}",
        AppExceptionUnknownError(error: var ex) =>
          "${context.appLoc.unkownError}: ${ex.msg(context)}",
      };
}

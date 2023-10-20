import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../extensions/context_extension.dart';

sealed class ApiException implements Exception {
  const ApiException();
}

final class ApiExceptionRequestCancelled extends ApiException {
  const ApiExceptionRequestCancelled();
}

final class ApiExceptionConnectTimeout extends ApiException {
  const ApiExceptionConnectTimeout();
}

final class ApiExceptionReceiveTimeout extends ApiException {
  const ApiExceptionReceiveTimeout();
}

final class ApiExceptionSendTimeout extends ApiException {
  const ApiExceptionSendTimeout();
}

final class ApiExceptionBadRequest extends ApiException {
  const ApiExceptionBadRequest();
}

final class ApiExceptionUnAuthorizedRequest extends ApiException {
  const ApiExceptionUnAuthorizedRequest();
}

final class ApiExceptionRequestNotFound extends ApiException {
  const ApiExceptionRequestNotFound();
}

final class ApiExceptionInternalServerError extends ApiException {
  const ApiExceptionInternalServerError();
}

final class ApiExceptionUnexpectedError extends ApiException {
  const ApiExceptionUnexpectedError();
}

final class ApiExceptionDefaultError extends ApiException {
  const ApiExceptionDefaultError(this.error);
  final String error;
}

extension DioExceptionExtension on DioException {
  ApiException get dioExceptionToApiException {
    return switch (type) {
      DioExceptionType.cancel => const ApiExceptionRequestCancelled(),
      DioExceptionType.connectionTimeout => const ApiExceptionConnectTimeout(),
      DioExceptionType.connectionError => const ApiExceptionConnectTimeout(),
      DioExceptionType.sendTimeout => const ApiExceptionSendTimeout(),
      DioExceptionType.receiveTimeout => const ApiExceptionReceiveTimeout(),
      DioExceptionType.badResponse => switch (response!.statusCode) {
          400 => const ApiExceptionBadRequest(),
          401 => const ApiExceptionUnAuthorizedRequest(),
          404 => const ApiExceptionRequestNotFound(),
          500 => const ApiExceptionInternalServerError(),
          _ => ApiExceptionDefaultError(
              "Received invalid status code: ${response!.statusCode}",
            )
        },
      _ => const ApiExceptionUnexpectedError()
    };
  }
}

extension ApiExceptionExtension on ApiException {
  String? msg(BuildContext context) => switch (this) {
        ApiExceptionRequestCancelled() => context.appLoc.requestCancelledError,
        ApiExceptionConnectTimeout() => context.appLoc.connectTimeoutError,
        ApiExceptionReceiveTimeout() => context.appLoc.receiveTimeoutError,
        ApiExceptionSendTimeout() => context.appLoc.sendTimeoutError,
        ApiExceptionBadRequest() => context.appLoc.badRequestError,
        ApiExceptionUnAuthorizedRequest() =>
          context.appLoc.unAuthorizedRequestError,
        ApiExceptionRequestNotFound() => context.appLoc.requestNotFoundError,
        ApiExceptionInternalServerError() => context.appLoc.internalServerError,
        ApiExceptionUnexpectedError() => context.appLoc.unexpectedError,
        ApiExceptionDefaultError(error: var ex) =>
          "${context.appLoc.defaultError}: $ex",
      };
}

import 'package:dio/dio.dart';

sealed class ApiException implements Exception {}

class ApiExceptionRequestCancelled implements ApiException {
  const ApiExceptionRequestCancelled();
}

class ApiExceptionConnectTimeout implements ApiException {
  const ApiExceptionConnectTimeout();
}

class ApiExceptionReceiveTimeout implements ApiException {
  const ApiExceptionReceiveTimeout();
}

class ApiExceptionSendTimeout implements ApiException {
  const ApiExceptionSendTimeout();
}

class ApiExceptionBadRequest implements ApiException {
  const ApiExceptionBadRequest();
}

class ApiExceptionUnAuthorizedRequest implements ApiException {
  const ApiExceptionUnAuthorizedRequest();
}

class ApiExceptionRequestNotFound implements ApiException {
  const ApiExceptionRequestNotFound();
}

class ApiExceptionInternalServerError implements ApiException {
  const ApiExceptionInternalServerError();
}

class ApiExceptionUnexpectedError implements ApiException {
  const ApiExceptionUnexpectedError();
}

class ApiExceptionDefaultError implements ApiException {
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

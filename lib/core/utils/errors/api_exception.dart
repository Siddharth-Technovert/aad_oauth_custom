import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException {
  const ApiException._();
  const factory ApiException.requestCancelled() = _RequestCancelled;
  const factory ApiException.connectTimeout() = _ConnectTimeout;
  const factory ApiException.receiveTimeout() = _ReceiveTimeout;
  const factory ApiException.sendTimeout() = _SendTimeout;

  const factory ApiException.badRequest() = _BadRequest;
  const factory ApiException.unAuthorizedRequest() = _UnAuthorizedRequest;
  const factory ApiException.requestNotFound() = _RequestNotFound;
  const factory ApiException.internalServerError() = _InternalServerError;
  const factory ApiException.unexpectedError() = _UnexpectedError;
  const factory ApiException.defaultError(String error) = _DefaultError;

  factory ApiException.getDioException(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return const ApiException.requestCancelled();
      case DioErrorType.connectTimeout:
        return const ApiException.connectTimeout();
      case DioErrorType.sendTimeout:
        return const ApiException.sendTimeout();
      case DioErrorType.receiveTimeout:
        return const ApiException.sendTimeout();
      case DioErrorType.response:
        switch (error.response!.statusCode) {
          case 400:
            return const ApiException.badRequest();
          case 401:
            return const ApiException.unAuthorizedRequest();
          case 404:
            return const ApiException.requestNotFound();
          case 500:
            return const ApiException.internalServerError();
          default:
            final responseCode = error.response!.statusCode;
            return ApiException.defaultError(
              "Received invalid status code: $responseCode",
            );
        }
      default:
        return const ApiException.unexpectedError();
    }
  }

  String get msg => when(
        requestCancelled: () => "Request to server was cancelled",
        connectTimeout: () => "Connection to server timed out",
        receiveTimeout: () => "Receive timeout in connection with server",
        sendTimeout: () => "Send timeout in connection with server",
        badRequest: () => "Error:400 Bad request",
        unAuthorizedRequest: () => "Error:401 Invalid api key",
        requestNotFound: () => "Error:404 Request not found",
        internalServerError: () => "Error:500 Internal server error",
        unexpectedError: () => "Error: Something went wrong",
        defaultError: (ex) => "Api Error occurred: $ex",
      );
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../l10n/app_loc.dart';

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

  factory ApiException.getDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        return const ApiException.requestCancelled();
      case DioExceptionType.connectionTimeout:
        return const ApiException.connectTimeout();
      case DioExceptionType.connectionError:
        return const ApiException.connectTimeout();
      case DioExceptionType.sendTimeout:
        return const ApiException.sendTimeout();
      case DioExceptionType.receiveTimeout:
        return const ApiException.sendTimeout();
      case DioExceptionType.badResponse:
        switch (exception.response!.statusCode) {
          case 400:
            return const ApiException.badRequest();
          case 401:
            return const ApiException.unAuthorizedRequest();
          case 404:
            return const ApiException.requestNotFound();
          case 500:
            return const ApiException.internalServerError();
          default:
            final responseCode = exception.response!.statusCode;
            return ApiException.defaultError(
              "Received invalid status code: $responseCode",
            );
        }
      default:
        return const ApiException.unexpectedError();
    }
  }

  String msg(BuildContext context) => when(
        requestCancelled: () => AppLoc.of(context).requestCancelled,
        connectTimeout: () => AppLoc.of(context).connectTimeout,
        receiveTimeout: () => AppLoc.of(context).receiveTimeout,
        sendTimeout: () => AppLoc.of(context).sendTimeout,
        badRequest: () => AppLoc.of(context).badRequest,
        unAuthorizedRequest: () => AppLoc.of(context).unAuthorizedRequest,
        requestNotFound: () => AppLoc.of(context).requestNotFound,
        internalServerError: () => AppLoc.of(context).internalServerError,
        unexpectedError: () => AppLoc.of(context).unexpectedError,
        defaultError: (ex) => "${AppLoc.of(context).defaultError}: $ex",
      );
}

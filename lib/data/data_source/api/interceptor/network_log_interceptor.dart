import 'package:dio/dio.dart';

import '../../../../core/device/logger_service.dart';

class NetworkLogInterceptor extends Interceptor {
  final LoggerService _log;
  NetworkLogInterceptor(this._log);
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler requestInterceptorHandler,
  ) async {
    _log.logInfo('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, requestInterceptorHandler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler responseInterceptorHandler,
  ) async {
    _log.logInfo(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, responseInterceptorHandler);
  }

  @override
  Future onError(
    DioError error,
    ErrorInterceptorHandler errorInterceptorHandler,
  ) async {
    _log.logInfo(
      'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
    );
    return super.onError(error, errorInterceptorHandler);
  }
}

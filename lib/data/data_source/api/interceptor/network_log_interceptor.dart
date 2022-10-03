import 'package:dio/dio.dart';

import '../../../../core/device/logging/logger_service.dart';

class NetworkLogInterceptor extends Interceptor {
  final LoggerService _log;
  NetworkLogInterceptor(this._log);
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler requestInterceptorHandler,
  ) async {
    _log.infoLog('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, requestInterceptorHandler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler responseInterceptorHandler,
  ) async {
    _log.infoLog(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, responseInterceptorHandler);
  }

  @override
  Future onError(
    DioError error,
    ErrorInterceptorHandler errorInterceptorHandler,
  ) async {
    _log.infoLog(
      'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
    );
    return super.onError(error, errorInterceptorHandler);
  }
}

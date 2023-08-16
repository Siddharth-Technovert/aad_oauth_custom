import 'package:dio/dio.dart';

import '../../../logger/logger_service.dart';

class NetworkLogInterceptor extends Interceptor {
  final LoggerService _log;
  NetworkLogInterceptor(this._log);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _log.infoLog('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _log.infoLog(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    _log.infoLog(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    _log.infoLog(
      'ERROR Log: [${err.response?.data}]',
    );
    super.onError(err, handler);
  }
}

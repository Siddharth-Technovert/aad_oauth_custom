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
    _log.infoLog('REQUEST [${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _log.infoLog(
      'RESPONSE [${response.statusCode}] => PATH: ${response.requestOptions.path}\nDATA: [${response.data}]',
    );
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (CancelToken.isCancel(err)) {
      _log.infoLog(
        'ERROR [Request Cancelled] => PATH: ${err.requestOptions.path}',
      );
    } else {
      _log.infoLog(
        'ERROR [${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\nDATA: ${err.response?.data}',
      );
    }
    super.onError(err, handler);
  }
}

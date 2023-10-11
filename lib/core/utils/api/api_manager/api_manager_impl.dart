import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../data/data_service_providers.dart';
import '../../../../presentation/providers/core/connectivity_provider.dart';
import '../../../configs/app_configuration.dart';
import '../../errors/api_exception.dart';
import '../../errors/app_exception.dart';
import '../../mappers/api_dto.dart';
import '../interceptor/auth_interceptor.dart';
import '../request_body.dart';
import '../request_type.dart';
import '../response/api_error_response.dart';
import '../response/api_response.dart';
import '../serializer_mixin.dart';
import 'api_manager.dart';

Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> parseJson(String text) {
  return compute(_parseAndDecode, text);
}

typedef HttpLibraryMethod<T> = Future<ApiResponse<T>> Function();

class ApiManagerImpl extends ApiManager with SerializerMixin {
  late final Dio _dio;
  late final CancelToken _cancelToken;
  late final Ref _ref;

  ApiManagerImpl(this._ref) {
    final BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      // baseUrl: AppConfiguration.baseUrl
    );

    // // Global options
    // final CacheOptions cacheOptions = CacheOptions(
    //   // A default store is required for interceptor.
    //   store: MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576),
    //   // Returns a cached response on error but for statuses 401 & 403.
    //   // Also allows to return a cached response on network errors (e.g. offline usage).
    //   // Defaults to [null].
    //   hitCacheOnErrorExcept: [401, 403],
    // );

    _dio = Dio(options);

    _dio.transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;
    _dio.interceptors.addAll([
      // DioCacheInterceptor(options: cacheOptions),
      LoggyDioInterceptor(
        errorLevel: LogLevel.all,
      ),
      // NetworkLogInterceptor(_ref.watch(loggerServiceProvider)),
      AuthInterceptor(_ref),
    ]);
    _cancelToken = CancelToken();
  }

  String _generateUrl(String endPoint, String? newBaseUrl) {
    //TODO: Please note this base url should end with "/"
    if (newBaseUrl == null) {
      final baseUrl = AppConfiguration.baseUrl;
      return "$baseUrl$endPoint";
    } else {
      return "$newBaseUrl$endPoint";
    }
  }

  @override
  Future<ApiResponse<T>> requestAsync<T extends ToJson>({
    required RequestType requestType,
    required String endpoint,
    String? newBaseUrl,
    RequestBody? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _tryApiRequest<T>(
      () async {
        final response = await _dio.request(
          _generateUrl(endpoint, newBaseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            method: requestType.name,
            headers: headers,
          ),
          cancelToken: cancelToken ?? _cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
        return serializeResponseData<T>(response.data as Map<String, dynamic>?);
      },
    );
  }

  @override
  Future<ApiResponse<List<T>>> requestListAsync<T extends ToJson>({
    required RequestType requestType,
    required String endpoint,
    String? newBaseUrl,
    RequestBody? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _tryApiRequest<List<T>>(
      () async {
        final response = await _dio.request(
          _generateUrl(endpoint, newBaseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            method: requestType.name,
            headers: headers,
          ),
          cancelToken: cancelToken ?? _cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
        return serializeResponseDataList<T>(response.data as List?);
      },
    );
  }

  // @override
  // Future<ApiResponse<Map<String, dynamic>>> getMapAsync({
  //   required String endpoint,
  //   String? newBaseUrl,
  //   Map<String, dynamic>? queryParams,
  //   Map<String, dynamic>? headers,
  //   CancelToken? cancelToken,
  // }) async {
  //   return _tryApiRequest<Map<String, dynamic>>(
  //     () async {
  //       final response = await _dio.get(
  //         _generateUrl(endpoint, newBaseUrl),
  //         queryParameters: queryParams,
  //         options: Options(
  //           headers: headers,
  //         ),
  //         cancelToken: cancelToken ?? _cancelToken,
  //       );
  //       final data = response.data as Map<String, dynamic>?;
  //       if (data == null) {
  //         return const ApiResponseError(
  //           AppExceptionUnknownError("Api Response is Empty"),
  //         );
  //       }
  //       return ApiResponseSuccess(
  //         data,
  //       );
  //     },
  //   );
  // }

  // // for APIs that give just a string as response
  // @override
  // Future<ApiResponse<String>> getStringAsync({
  //   required String endpoint,
  //   String? newBaseUrl,
  //   Map<String, dynamic>? queryParams,
  //   Map<String, dynamic>? headers,
  //   CancelToken? cancelToken,
  // }) async {
  //   return _tryApiRequest<String>(() async {
  //     final response = await _dio.get(
  //       _generateUrl(endpoint, newBaseUrl),
  //       queryParameters: queryParams,
  //       options: Options(
  //         headers: headers,
  //       ),
  //       cancelToken: cancelToken ?? _cancelToken,
  //     );
  //     final data = response.data as String?;
  //     if (data == null) {
  //       return const ApiResponseError(
  //         AppExceptionUnknownError("Api Response is Empty"),
  //       );
  //     }
  //     return ApiResponseSuccess(
  //       data,
  //     );
  //   });
  // }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Request Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  Future<ApiResponse<T>> _tryApiRequest<T>(
    HttpLibraryMethod<T> executeMethod,
  ) async {
    try {
      if (_ref.read(connectivityStatusProvider).value == true) {
        return await executeMethod();
      } else {
        return const ApiResponseError(AppExceptionNetworkError());
      }
    } on DioException catch (ex, stackTrace) {
      // _loggerService.errorLog(ex, s);

      if (!CancelToken.isCancel(ex)) {
        await _ref.read(loggerServiceProvider).dioExceptionLog(
              "${ex.requestOptions.path}/${ex.requestOptions.queryParameters}",
              ex,
              stackTrace,
            );
      } else {
        return const ApiResponseError(
          AppExceptionUnknownError("Request is cancelled."),
        );
      }

      try {
        return ApiResponseError(
          AppExceptionApiError(
            ex.response == null || ex.response!.data == null
                ? null
                : ApiErrorResponse.fromJson(
                    ex.response!.data! as Map<String, dynamic>,
                  ),
            ex.dioExceptionToApiException,
          ),
        );
      } catch (_, __) {
        return ApiResponseError(
          AppExceptionApiError(
            ApiErrorResponse(
              reason: ex.message,
              code: ex.response?.data.toString(),
              error: null,
              message: null,
              data: null,
            ),
            ex.dioExceptionToApiException,
          ),
        );
      }
    } catch (ex, _) {
      // _loggerService.errorLog(ex, s);
      return ApiResponseError(
        AppExceptionApiError(null, ApiExceptionDefaultError(ex.toString())),
      );
    }
  }
}

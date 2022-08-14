import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/configs/app_serializers.dart';
import '../../../core/device/logger_service.dart';
import '../../../core/utils/errors/api_exception.dart';
import '../../../core/utils/errors/app_exception.dart';
import '../local/storage_manager.dart';
import 'api_manager.dart';
import 'interceptor/auth_interceptor.dart';
import 'interceptor/network_log_interceptor.dart';
import 'response/api_response.dart';

class ApiManagerImpl extends ApiManager {
  final LoggerService _log;
  final StorageManager _storageManager;
  late Dio _dio;

  ApiManagerImpl(String baseUrl, this._log, this._storageManager) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 50000,
    );

    _dio = Dio(options);
    _dio.interceptors.addAll([
      NetworkLogInterceptor(_log),
      AuthInterceptor(_storageManager),
    ]);
  }

  Map<String, dynamic> generateHeaders(Map<String, dynamic>? headers) {
    final Map<String, dynamic> headersMap = {};
    headersMap[HttpHeaders.contentTypeHeader] = "application/json";
    if (headers != null) {
      headersMap.addAll(headers);
    }
    return headersMap;
  }

  @override
  Future<ApiResponse<T>> getAsync<T>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final url = baseUrl == null ? endpoint : "$baseUrl/$endpoint";
      final requestHeaders = generateHeaders(headers);
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: requestHeaders,
        ),
        cancelToken: cancelToken,
      );
      if (AppSerializers.serializers[T] != null) {
        return ApiResponse<T>.success(
          AppSerializers.serializers[T]!(response.data as Map<String, dynamic>)
              as T,
        );
      } else {
        return const ApiResponse.error(
          AppException.serializationError(),
        );
      }
    } on DioError catch (error) {
      return ApiResponse.error(
        AppException.apiError(ApiException.getDioException(error)),
      );
    } catch (ex) {
      return ApiResponse.error(
        AppException.apiError(ApiException.defaultError(ex.toString())),
      );
    }
  }

  @override
  Future<ApiResponse<List<T>>> getAsyncList<T>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final url = baseUrl == null ? endpoint : "$baseUrl/$endpoint";
      final requestHeaders = generateHeaders(headers);
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: requestHeaders,
        ),
        cancelToken: cancelToken,
      );
      if (AppSerializers.serializers[T] != null) {
        return ApiResponse<List<T>>.success(
          AppSerializers.listSerializers[List<T>]!(
            response.data as List,
          ) as List<T>,
        );
      } else {
        return const ApiResponse.error(
          AppException.serializationError(),
        );
      }
    } on DioError catch (error) {
      return ApiResponse.error(
        AppException.apiError(ApiException.getDioException(error)),
      );
    } catch (ex) {
      return ApiResponse.error(
        AppException.apiError(ApiException.defaultError(ex.toString())),
      );
    }
  }

  // if need to post only one object then data will be: post.toJson() i.e Map<String, dynamic>,
  // else data will be posts.map((post) => post.toJson()).toList() i.e List<Map<String,dynamic>>
  @override
  Future<ApiResponse<bool>> postAsync<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final url = baseUrl == null ? endpoint : "$baseUrl/$endpoint";
      final requestHeaders = generateHeaders(headers);
      await _dio.post(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: requestHeaders,
        ),
        cancelToken: cancelToken,
      );
      return const ApiResponse<bool>.success(true);
    } on DioError catch (error) {
      return ApiResponse.error(
        AppException.apiError(ApiException.getDioException(error)),
      );
    } catch (ex) {
      return ApiResponse.error(
        AppException.apiError(ApiException.defaultError(ex.toString())),
      );
    }
  }

  @override
  Future<ApiResponse<T>> putAsync<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final url = baseUrl == null ? endpoint : "$baseUrl/$endpoint";
      final requestHeaders = generateHeaders(headers);
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: requestHeaders,
        ),
        cancelToken: cancelToken,
      );
      if (AppSerializers.serializers[T] != null) {
        return ApiResponse<T>.success(
          AppSerializers.serializers[T]!(response.data as Map<String, dynamic>)
              as T,
        );
      } else {
        return const ApiResponse.error(
          AppException.serializationError(),
        );
      }
    } on DioError catch (error) {
      return ApiResponse.error(
        AppException.apiError(ApiException.getDioException(error)),
      );
    } catch (ex) {
      return ApiResponse.error(
        AppException.apiError(ApiException.defaultError(ex.toString())),
      );
    }
  }

  // give the id of object need to be deleted in endpoint otherwise give data
  // if need to delete only one object then data will be: post.toJson() i.e Map<String, dynamic>,
  // else data will be posts.map((post) => post.toJson()).toList() i.e List<Map<String,dynamic>>
  @override
  Future<ApiResponse<bool>> deleteAsync<T>({
    required String endpoint,
    dynamic data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final url = baseUrl == null ? endpoint : "$baseUrl/$endpoint";
      final requestHeaders = generateHeaders(headers);
      await _dio.delete(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: requestHeaders,
        ),
        cancelToken: cancelToken,
      );
      return const ApiResponse<bool>.success(true);
    } on DioError catch (error) {
      return ApiResponse.error(
        AppException.apiError(ApiException.getDioException(error)),
      );
    } catch (ex) {
      return ApiResponse.error(
        AppException.apiError(ApiException.defaultError(ex.toString())),
      );
    }
  }
}

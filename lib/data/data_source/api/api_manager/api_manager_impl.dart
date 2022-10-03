import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';

import '../../../../core/configs/app_serializers.dart';
import '../../../../core/device/connectivity_service.dart';
import '../../../../core/utils/errors/api_exception.dart';
import '../../../../core/utils/errors/app_exception.dart';
import '../../../mappers/api_dto.dart';
import '../../local/secure_storage/secure_storage_manager.dart';
import '../interceptor/auth_interceptor.dart';
import '../response/api_response.dart';
import 'api_manager.dart';

typedef HttpLibraryMethod<T> = Future<ApiResponse<T>> Function();

class ApiManagerImpl extends ApiManager {
  final SecureStorageManager _secureStorageManager;
  // final LoggerService _loggerService;

  late final Dio _dio;
  late final CancelToken _cancelToken;

  ApiManagerImpl(
    this._secureStorageManager,
    // this._loggerService,
  ) {
    final BaseOptions options = BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 50000,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    _dio = Dio(options);
    _dio.interceptors.addAll([
      LoggyDioInterceptor(),
      // NetworkLogInterceptor(_loggerService),
      AuthInterceptor(_secureStorageManager),
    ]);
    _cancelToken = CancelToken();
  }

  String _generateUrl(String endPoint, String? newBaseUrl) {
    return newBaseUrl == null ? endPoint : "$newBaseUrl/$endPoint";
  }

  Map<String, dynamic> _generateHeader(
    Map<String, dynamic>? headers,
    bool requiresAuthToken,
  ) {
    final newHeaders = headers ?? {};
    newHeaders.addAll({'requiresAuthToken': requiresAuthToken});
    return newHeaders;
  }

  @override
  Future<ApiResponse<T>> getAsync<T extends ToJson>({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  }) async {
    return _tryApiRequest<T>(
      () async {
        final response = await _dio.get(
          _generateUrl(endpoint, newBaseUrl),
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeader(headers, requiresAuthToken),
          ),
          cancelToken: cancelToken ?? _cancelToken,
        );
        if (AppSerializers.serializers[T] != null) {
          return ApiResponse<T>.success(
            AppSerializers
                .serializers[T]!(response.data as Map<String, dynamic>) as T,
          );
        } else {
          return const ApiResponse.error(
            AppException.serializationError(),
          );
        }
      },
    );
  }

  @override
  Future<ApiResponse<List<T>>> getAsyncList<T extends ToJson>({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  }) async {
    return _tryApiRequest<List<T>>(
      () async {
        final response = await _dio.get(
          _generateUrl(endpoint, newBaseUrl),
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeader(headers, requiresAuthToken),
          ),
          cancelToken: cancelToken ?? _cancelToken,
        );
        if (AppSerializers.serializers[T] != null) {
          final listData = response.data as List;
          return ApiResponse<List<T>>.success(
            listData
                .map(
                  (e) => AppSerializers.serializers[T]!(
                    response.data as Map<String, dynamic>,
                  ) as T,
                )
                .toList(),
          );
          // return ApiResponse<List<T>>.success(
          //   AppSerializers.listSerializers[List<T>]!(
          //     response.data as List,
          //   ) as List<T>,
          // );
        } else {
          return const ApiResponse.error(
            AppException.serializationError(),
          );
        }
      },
    );
  }

  // if need to post only one object then data will be: post.toJson() i.e Map<String, dynamic>,
  // else data will be posts.map((post) => post.toJson()).toList() i.e List<Map<String,dynamic>>
  @override
  Future<ApiResponse<bool>> postAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  }) async {
    return _tryApiRequest<bool>(
      () async {
        await _dio.post(
          _generateUrl(endpoint, newBaseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeader(headers, requiresAuthToken),
          ),
          cancelToken: cancelToken ?? _cancelToken,
        );
        return const ApiResponse<bool>.success(true);
      },
    );
  }

  @override
  Future<ApiResponse<T>> putAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  }) async {
    return _tryApiRequest<T>(
      () async {
        final response = await _dio.put(
          _generateUrl(endpoint, newBaseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeader(headers, requiresAuthToken),
          ),
          cancelToken: cancelToken ?? _cancelToken,
        );
        if (AppSerializers.serializers[T] != null) {
          return ApiResponse<T>.success(
            AppSerializers
                .serializers[T]!(response.data as Map<String, dynamic>) as T,
          );
        } else {
          return const ApiResponse.error(
            AppException.serializationError(),
          );
        }
      },
    );
  }

  // give the id of object need to be deleted in endpoint otherwise give data
  // if need to delete only one object then data will be: post.toJson() i.e Map<String, dynamic>,
  // else data will be posts.map((post) => post.toJson()).toList() i.e List<Map<String,dynamic>>
  @override
  Future<ApiResponse<bool>> deleteAsync<T extends ToJson>({
    required String endpoint,
    dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  }) async {
    return _tryApiRequest<bool>(
      () async {
        await _dio.delete(
          _generateUrl(endpoint, newBaseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeader(headers, requiresAuthToken),
          ),
          cancelToken: cancelToken ?? _cancelToken,
        );
        return const ApiResponse<bool>.success(true);
      },
    );
  }

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
      if (await ConnectivityService.hasConnection()) {
        return await executeMethod();
      } else {
        throw const AppException.networkError();
      }
    } on DioError catch (ex, _) {
      // _loggerService.errorLog(ex, s);
      return ApiResponse.error(
        AppException.apiError(ApiException.getDioException(ex)),
      );
    } catch (ex, _) {
      // _loggerService.errorLog(ex, s);
      return ApiResponse.error(
        AppException.apiError(ApiException.defaultError(ex.toString())),
      );
    }
  }
}

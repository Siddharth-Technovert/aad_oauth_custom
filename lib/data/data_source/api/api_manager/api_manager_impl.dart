import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/configs/app_serializers.dart';
import '../../../../core/device/connectivity_service.dart';
import '../../../../core/device/logger_service.dart';
import '../../../../core/utils/errors/api_exception.dart';
import '../../../../core/utils/errors/app_exception.dart';
import '../../../mappers/api_dto.dart';
import '../../local/secure_storage/secure_storage_manager.dart';
import '../interceptor/auth_interceptor.dart';
import '../interceptor/network_log_interceptor.dart';
import '../response/api_response.dart';
import 'api_manager.dart';

typedef HttpLibraryMethod<T> = Future<ApiResponse<T>> Function();

class ApiManagerImpl extends ApiManager {
  final LoggerService _loggerService;
  final SecureStorageManager _secureStorageManager;
  late Dio _dio;

  ApiManagerImpl(
    String baseUrl,
    this._loggerService,
    this._secureStorageManager,
  ) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 50000,
    );

    _dio = Dio(options);
    _dio.interceptors.addAll([
      NetworkLogInterceptor(_loggerService),
      AuthInterceptor(_secureStorageManager),
    ]);
  }

  String _generateUrl(String endPoint, String? newBaseUrl) {
    return newBaseUrl == null ? endPoint : "$newBaseUrl/$endPoint";
  }

  Map<String, dynamic> _generateHeaders(Map<String, dynamic>? headers) {
    final Map<String, dynamic> headersMap = {};
    headersMap[HttpHeaders.contentTypeHeader] = "application/json";
    if (headers != null) {
      headersMap.addAll(headers);
    }
    return headersMap;
  }

  @override
  Future<ApiResponse<T>> getAsync<T extends ToJson>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return _tryApiRequest<T>(
      () async {
        final response = await _dio.get(
          _generateUrl(endpoint, baseUrl),
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeaders(headers),
          ),
          cancelToken: cancelToken,
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
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return _tryApiRequest<List<T>>(
      () async {
        final response = await _dio.get(
          _generateUrl(endpoint, baseUrl),
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeaders(headers),
          ),
          cancelToken: cancelToken,
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
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return _tryApiRequest<bool>(
      () async {
        await _dio.post(
          _generateUrl(endpoint, baseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeaders(headers),
          ),
          cancelToken: cancelToken,
        );
        return const ApiResponse<bool>.success(true);
      },
    );
  }

  @override
  Future<ApiResponse<T>> putAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return _tryApiRequest<T>(
      () async {
        final response = await _dio.put(
          _generateUrl(endpoint, baseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeaders(headers),
          ),
          cancelToken: cancelToken,
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
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    return _tryApiRequest<bool>(
      () async {
        await _dio.delete(
          _generateUrl(endpoint, baseUrl),
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeaders(headers),
          ),
          cancelToken: cancelToken,
        );
        return const ApiResponse<bool>.success(true);
      },
    );
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
    } on DioError catch (error) {
      _loggerService.logInfo(error.toString());
      return ApiResponse.error(
        AppException.apiError(ApiException.getDioException(error)),
      );
    } catch (ex) {
      _loggerService.logInfo(ex.toString());
      throw ApiResponse.error(
        AppException.apiError(ApiException.defaultError(ex.toString())),
      );
    }
  }
}

import 'package:dio/dio.dart';

import '../../mappers/api_dto.dart';
import '../response/api_response.dart';

abstract class ApiManager {
  Future<ApiResponse<T>> getAsync<T extends ToJson>({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<List<T>>> getAsyncList<T extends ToJson>({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<T>> postAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });
  Future<ApiResponse<List<T>>> postAsyncList<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<T>> putAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<T>> deleteAsync<T extends ToJson>({
    required String endpoint,
    dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });
  Future<ApiResponse<List<T>>> deleteAsyncList<T extends ToJson>({
    required String endpoint,
    dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<Map<String, dynamic>>> getMapAsync({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  // for APIs that give just a string as response
  Future<ApiResponse<String>> getStringAsync({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  void cancelRequests({CancelToken? cancelToken});
}

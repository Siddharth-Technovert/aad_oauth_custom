import 'package:dio/dio.dart';

import '../../../mappers/api_dto.dart';
import '../response/api_response.dart';

abstract class ApiManager {
  Future<ApiResponse<T>> getAsync<T extends ToJson>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<List<T>>> getAsyncList<T extends ToJson>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<bool>> postAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<T>> putAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });

  Future<ApiResponse<bool>> deleteAsync<T extends ToJson>({
    required String endpoint,
    dynamic data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  });
}

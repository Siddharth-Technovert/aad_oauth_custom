import 'package:dio/dio.dart';

import '../../../mappers/api_dto.dart';
import '../response/api_response.dart';

abstract class ApiManager {
  Future<ApiResponse<T>> getAsync<T extends ToJson>({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  });

  Future<ApiResponse<List<T>>> getAsyncList<T extends ToJson>({
    required String endpoint,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  });

  Future<ApiResponse<bool>> postAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  });

  Future<ApiResponse<T>> putAsync<T extends ToJson>({
    required String endpoint,
    required dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  });

  Future<ApiResponse<bool>> deleteAsync<T extends ToJson>({
    required String endpoint,
    dynamic data,
    String? newBaseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
  });

  void cancelRequests({CancelToken? cancelToken});
}

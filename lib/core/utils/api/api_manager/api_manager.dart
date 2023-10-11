import 'package:dio/dio.dart';

import '../../mappers/api_dto.dart';
import '../request_body.dart';
import '../request_type.dart';
import '../response/api_response.dart';

abstract class ApiManager {
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
  });

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
  });

  // Future<ApiResponse<Map<String, dynamic>>> getMapAsync({
  //   required String endpoint,
  //   String? newBaseUrl,
  //   Map<String, dynamic>? queryParams,
  //   Map<String, dynamic>? headers,
  //   CancelToken? cancelToken,
  // });

  // // for APIs that give just a string as response
  // Future<ApiResponse<String>> getStringAsync({
  //   required String endpoint,
  //   String? newBaseUrl,
  //   Map<String, dynamic>? queryParams,
  //   Map<String, dynamic>? headers,
  //   CancelToken? cancelToken,
  // });

  void cancelRequests({CancelToken? cancelToken});
}

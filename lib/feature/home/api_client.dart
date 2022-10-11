import 'package:dio/dio.dart';

import '../../core/device/connectivity_service.dart';
import '../../core/utils/api/api_manager/api_manager.dart';
import '../../core/utils/errors/app_exception.dart';
import '../../core/utils/mappers/api_dto.dart';
import '../../core/utils/mappers/ui_model.dart';
import '../../shared/data/models/result/data_state.dart';

class ApiClient {
  final ApiManager _apiManager;
  ApiClient(this._apiManager);

  Future<DataState<Model>>
      getAsync<Model extends UIModel<Dto>, Dto extends ApiDto<Model>>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.getAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) => DataState.success(data.toModel()),
        error: (error) => DataState.error(error),
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<List<Model>>>
      getAsyncList<Model extends UIModel<Dto>, Dto extends ApiDto<Model>>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.getAsyncList<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (dataList) => DataState.success(
          dataList.map((data) => data.toModel()).toList(),
        ),
        error: (error) => DataState.error(error),
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<bool>>
      postAsync<Model extends UIModel<Dto>, Dto extends ApiDto<Model>>({
    required String endpoint,
    required Model data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.postAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        data: data.toApiDto().toJson(),
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) => DataState.success(data),
        error: (error) => DataState.error(error),
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<bool>>
      postAsyncList<Model extends UIModel<Dto>, Dto extends ApiDto<Model>>({
    required String endpoint,
    required List<Model> dataList,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.postAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        data: dataList.map((post) => post.toApiDto().toJson()).toList(),
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) => DataState.success(data),
        error: (error) => DataState.error(error),
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<Model>>
      putAsync<Model extends UIModel<Dto>, Dto extends ApiDto<Model>>({
    required String endpoint,
    required Model updatedData,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.putAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        // serializer: serializer,
        data: updatedData.toApiDto().toJson(),
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) => DataState.success(data.toModel()),
        error: (error) => DataState.error(error),
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<bool>>
      deleteAsync<Model extends UIModel<Dto>, Dto extends ApiDto<Model>>({
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.deleteAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) => DataState.success(data),
        error: (error) => DataState.error(error),
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }
}

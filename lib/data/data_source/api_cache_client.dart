import 'package:dio/dio.dart';

import '../../core/device/connectivity_service.dart';
import '../../core/logger/logger_service.dart';
import '../../core/utils/local_storage/cache/cache_manager.dart';
import '../../core/utils/mappers/api_dto.dart';
import '../../core/utils/mappers/cache_dto.dart';
import '../../core/utils/mappers/ui_model.dart';
import '../../core/utils/api/api_manager/api_manager.dart';
import '../../core/utils/errors/app_exception.dart';
import '../../core/utils/errors/cache_exception.dart';
import '../models/result/data_state.dart';

//TODO: Add Support for editing of data in offline mode use SyncModel concept

class ApiCacheClient {
  final ApiManager _apiManager;
  final CacheManager _cachingManager;
  final LoggerService _loggerService;
  ApiCacheClient(
    this._apiManager,
    this._cachingManager,
    this._loggerService,
  );

  Future<DataState<Model>> getAsync<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>({
    required String boxKey,
    required String endpoint,
    required String id,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      // final hiveDataDto = await _cachingManager.getData<Model, HiveDto, Dto>(
      //   boxKey,
      //   id,
      // );
      // if (hiveDataDto != null) {
      //   return DataState.success(hiveDataDto.toModel());
      // }
      final apiResponse = await _apiManager.getAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) async {
          final hiveDataDto = data.toCacheDto();
          final isAdded = await _cachingManager.insertData<HiveDto>(
            boxKey,
            hiveDataDto,
          );
          if (isAdded) {
            return DataState.success(hiveDataDto.toModel());
          } else {
            return const DataState.error(
              AppException.cacheError(CacheException.insertError()),
            );
          }
        },
        error: (error) {
          return DataState.error(error);
        },
      );
    } else {
      _loggerService.infoLog("Cache hit");

      final cachedData = await _cachingManager.getData<HiveDto>(
        boxKey,
        id,
      );
      if (cachedData != null) {
        return DataState.success(cachedData.toModel());
      }
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<List<Model>>> getAsyncList<
      Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>,
      Dto extends ApiCacheDto<HiveDto>>({
    required String boxKey,
    required String endpoint,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    if (await ConnectivityService.hasConnection()) {
      // final hasCachedData =
      //     await _cachingManager.hasData<Model, HiveDto, Dto>(boxKey);
      // final hiveDtoModeList =
      //     await _cachingManager.getAll<Model, HiveDto, Dto>(boxKey);

      // if (hasCachedData && hiveDtoModeList != null) {
      //   return DataState.success(
      //     hiveDtoModeList.map((e) => e.toModel()).toList(),
      //   );
      // }
      final apiResponse = await _apiManager.getAsyncList<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (dataList) async {
          final hiveDtoModeList =
              dataList.map((data) => data.toCacheDto()).toList();
          final isAdded = await _cachingManager.insertDataList<HiveDto>(
            boxKey,
            hiveDtoModeList,
          );
          if (isAdded) {
            return DataState.success(
              hiveDtoModeList.map((e) => e.toModel()).toList(),
            );
          } else {
            return const DataState.error(
              AppException.cacheError(CacheException.insertError()),
            );
          }
        },
        error: (error) {
          return DataState.error(error);
        },
      );
    } else {
      _loggerService.infoLog("Cache hit");

      final hasCachedData = await _cachingManager.hasData<HiveDto>(boxKey);
      final cachedDataList = await _cachingManager.getAll<HiveDto>(boxKey);

      if (hasCachedData && cachedDataList != null) {
        return DataState.success(
          cachedDataList.map((e) => e.toModel()).toList(),
        );
      }
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<bool>> postAsync<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>({
    required String boxKey,
    required String endpoint,
    required Model data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    final cachedData = data.toCacheDto();

    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.postAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        data: cachedData.toApiDto().toJson(),
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) async {
          final isAdded = await _cachingManager.insertData<HiveDto>(
            boxKey,
            cachedData,
          );
          if (isAdded) {
            return const DataState.success(true);
          } else {
            return const DataState.error(
              AppException.cacheError(CacheException.insertError()),
            );
          }
        },
        error: (error) {
          return DataState.error(error);
        },
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<bool>> postAsyncList<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>({
    required String boxKey,
    required String endpoint,
    required List<Model> dataList,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    final cachedDataList = dataList.map((data) => data.toCacheDto()).toList();

    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.postAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        data: cachedDataList.map((e) => e.toApiDto().toJson()).toList(),
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) async {
          final isAdded = await _cachingManager.insertDataList<HiveDto>(
            boxKey,
            cachedDataList,
          );
          if (isAdded) {
            return const DataState.success(true);
          } else {
            return const DataState.error(
              AppException.cacheError(CacheException.insertError()),
            );
          }
        },
        error: (error) {
          return DataState.error(error);
        },
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<Model>> putAsyncList<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>({
    required String boxKey,
    required String endpoint,
    required Model data,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    //TODO: check for updating hive data first not at last otherwise
    //TODO: delete whole and then update it with latest data when error arrives

    if (await ConnectivityService.hasConnection()) {
      final apiResponse = await _apiManager.putAsync<Dto>(
        newBaseUrl: baseUrl,
        endpoint: endpoint,
        data: data.toCacheDto().toApiDto().toJson(),
        queryParams: queryParams,
        headers: headers,
        cancelToken: cancelToken,
      );
      return apiResponse.when(
        success: (data) async {
          final cachedData = data.toCacheDto();

          final isUpdated = await _cachingManager.updateData<HiveDto>(
            boxKey,
            cachedData,
          );
          if (isUpdated) {
            return DataState.success(cachedData.toModel());
          } else {
            return const DataState.error(
              AppException.cacheError(CacheException.updateError()),
            );
          }
        },
        error: (error) {
          return DataState.error(error);
        },
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }

  Future<DataState<bool>> deleteAsync<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>({
    required String boxKey,
    required String endpoint,
    required String id,
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
        success: (data) async {
          final isDeleted = await _cachingManager.deleteSingle<HiveDto>(
            boxKey,
            id,
          );
          if (isDeleted) {
            return const DataState.success(true);
          } else {
            return const DataState.error(
              AppException.cacheError(CacheException.deleteError()),
            );
          }
        },
        error: (error) {
          return DataState.error(error);
        },
      );
    } else {
      return const DataState.error(AppException.networkError());
    }
  }
}

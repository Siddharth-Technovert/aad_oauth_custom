import 'dart:convert';

import '../../configs/app_serializers.dart';
import '../errors/app_exception.dart';
import 'response/api_response.dart';

mixin SerializerMixin {
  Future<ApiResponse<T>> serializeResponseData<T>(
      Map<String, dynamic>? data) async {
    if (data == null) {
      return const ApiResponseError(
        AppExceptionUnknownError("Api Response is Null"),
      );
    }
    return ApiResponseSuccess(
      AppSerializer.fromJson<T>(data),
    );
  }

  Future<ApiResponse<List<T>>> serializeResponseDataList<T>(
    List<dynamic>? listData,
  ) async {
    if (listData == null) {
      return const ApiResponseSuccess([]);
    }
    return ApiResponseSuccess(
      listData
          .map(
            (e) => AppSerializer.fromJson<T>(jsonDecode(e)),
          )
          .toList(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../l10n/app_loc.dart';
import 'api_exception.dart';
import 'cache_exception.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const AppException._();
  const factory AppException.networkError() = _NetworkError;
  const factory AppException.cacheError(CacheException error) = _CacheError;
  const factory AppException.serializationError() = _SerializationError;
  const factory AppException.apiError(ApiException error) = _ApiError;
  const factory AppException.unknownError(dynamic error) = _UnknownError;

  String msg(BuildContext context) => when(
        networkError: () => AppLoc.of(context).networkError,
        cacheError: (ex) => "${AppLoc.of(context).cacheError} ${ex.msg}",
        serializationError: () => AppLoc.of(context).serializationError,
        apiError: (ex) => "${AppLoc.of(context).apiError} ${ex.msg}",
        unknownError: (ex) => "${AppLoc.of(context).unknownError} $ex",
      );
}

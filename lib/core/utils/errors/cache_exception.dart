import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../l10n/app_loc.dart';

part 'cache_exception.freezed.dart';

@freezed
class CacheException with _$CacheException {
  const CacheException._();
  const factory CacheException.fetchError() = _FetchError;
  const factory CacheException.insertError() = _InsertError;
  const factory CacheException.deleteError() = _DeleteError;
  const factory CacheException.updateError() = _UpdateError;

  String msg(BuildContext context) => when(
        fetchError: () => AppLoc.of(context).fetchCacheError,
        insertError: () => AppLoc.of(context).insertCacheError,
        deleteError: () => AppLoc.of(context).deleteCacheError,
        updateError: () => AppLoc.of(context).updateCacheError,
      );
}

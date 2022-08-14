import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_exception.freezed.dart';

@freezed
class CacheException with _$CacheException {
  const CacheException._();
  const factory CacheException.fetchError() = _FetchError;
  const factory CacheException.insertError() = _InsertError;
  const factory CacheException.deleteError() = _DeleteError;
  const factory CacheException.updateError() = _UpdateError;

  String get msg => when(
        fetchError: () => "Failed to fetch data from cache",
        insertError: () => "Failed to add data to cache",
        deleteError: () => "Failed to delete data to cache",
        updateError: () => "Failed to update data to cache",
      );
}

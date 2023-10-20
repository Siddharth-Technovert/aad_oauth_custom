import 'package:flutter/widgets.dart';

import '../extensions/context_extension.dart';

sealed class CacheException implements Exception {
  const CacheException();
}

final class CacheExceptionFetchError extends CacheException {
  const CacheExceptionFetchError();
}

final class CacheExceptionInsertError extends CacheException {
  const CacheExceptionInsertError();
}

final class CacheExceptionDeleteError extends CacheException {
  const CacheExceptionDeleteError();
}

final class CacheExceptionUpdateError extends CacheException {
  const CacheExceptionUpdateError();
}

extension CacheExceptionExtension on CacheException {
  String msg(BuildContext context) => switch (this) {
        CacheExceptionFetchError() => context.appLoc.fetchCacheError,
        CacheExceptionInsertError() => context.appLoc.insertCacheError,
        CacheExceptionDeleteError() => context.appLoc.deleteCacheError,
        CacheExceptionUpdateError() => context.appLoc.updateCacheError,
      };
}

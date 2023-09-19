import 'package:flutter/widgets.dart';

import '../extensions/context_extension.dart';

sealed class CacheException implements Exception {}

class CacheExceptionFetchError implements CacheException {
  const CacheExceptionFetchError();
}

class CacheExceptionInsertError implements CacheException {
  const CacheExceptionInsertError();
}

class CacheExceptionDeleteError implements CacheException {
  const CacheExceptionDeleteError();
}

class CacheExceptionUpdateError implements CacheException {
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

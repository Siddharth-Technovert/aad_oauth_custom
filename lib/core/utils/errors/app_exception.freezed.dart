// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(CacheException error) cacheError,
    required TResult Function() serializationError,
    required TResult Function(ApiException error) apiError,
    required TResult Function(dynamic error) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_CacheError value) cacheError,
    required TResult Function(_SerializationError value) serializationError,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_UnknownError value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res> implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  final AppException _value;
  // ignore: unused_field
  final $Res Function(AppException) _then;
}

/// @nodoc
abstract class _$$_NetworkErrorCopyWith<$Res> {
  factory _$$_NetworkErrorCopyWith(
          _$_NetworkError value, $Res Function(_$_NetworkError) then) =
      __$$_NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NetworkErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$_NetworkErrorCopyWith<$Res> {
  __$$_NetworkErrorCopyWithImpl(
      _$_NetworkError _value, $Res Function(_$_NetworkError) _then)
      : super(_value, (v) => _then(v as _$_NetworkError));

  @override
  _$_NetworkError get _value => super._value as _$_NetworkError;
}

/// @nodoc

class _$_NetworkError extends _NetworkError {
  const _$_NetworkError() : super._();

  @override
  String toString() {
    return 'AppException.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(CacheException error) cacheError,
    required TResult Function() serializationError,
    required TResult Function(ApiException error) apiError,
    required TResult Function(dynamic error) unknownError,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_CacheError value) cacheError,
    required TResult Function(_SerializationError value) serializationError,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError extends AppException {
  const factory _NetworkError() = _$_NetworkError;
  const _NetworkError._() : super._();
}

/// @nodoc
abstract class _$$_CacheErrorCopyWith<$Res> {
  factory _$$_CacheErrorCopyWith(
          _$_CacheError value, $Res Function(_$_CacheError) then) =
      __$$_CacheErrorCopyWithImpl<$Res>;
  $Res call({CacheException error});

  $CacheExceptionCopyWith<$Res> get error;
}

/// @nodoc
class __$$_CacheErrorCopyWithImpl<$Res> extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$_CacheErrorCopyWith<$Res> {
  __$$_CacheErrorCopyWithImpl(
      _$_CacheError _value, $Res Function(_$_CacheError) _then)
      : super(_value, (v) => _then(v as _$_CacheError));

  @override
  _$_CacheError get _value => super._value as _$_CacheError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_CacheError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CacheException,
    ));
  }

  @override
  $CacheExceptionCopyWith<$Res> get error {
    return $CacheExceptionCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$_CacheError extends _CacheError {
  const _$_CacheError(this.error) : super._();

  @override
  final CacheException error;

  @override
  String toString() {
    return 'AppException.cacheError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CacheError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_CacheErrorCopyWith<_$_CacheError> get copyWith =>
      __$$_CacheErrorCopyWithImpl<_$_CacheError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(CacheException error) cacheError,
    required TResult Function() serializationError,
    required TResult Function(ApiException error) apiError,
    required TResult Function(dynamic error) unknownError,
  }) {
    return cacheError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
  }) {
    return cacheError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
    required TResult orElse(),
  }) {
    if (cacheError != null) {
      return cacheError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_CacheError value) cacheError,
    required TResult Function(_SerializationError value) serializationError,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return cacheError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
  }) {
    return cacheError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (cacheError != null) {
      return cacheError(this);
    }
    return orElse();
  }
}

abstract class _CacheError extends AppException {
  const factory _CacheError(final CacheException error) = _$_CacheError;
  const _CacheError._() : super._();

  CacheException get error;
  @JsonKey(ignore: true)
  _$$_CacheErrorCopyWith<_$_CacheError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SerializationErrorCopyWith<$Res> {
  factory _$$_SerializationErrorCopyWith(_$_SerializationError value,
          $Res Function(_$_SerializationError) then) =
      __$$_SerializationErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SerializationErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$_SerializationErrorCopyWith<$Res> {
  __$$_SerializationErrorCopyWithImpl(
      _$_SerializationError _value, $Res Function(_$_SerializationError) _then)
      : super(_value, (v) => _then(v as _$_SerializationError));

  @override
  _$_SerializationError get _value => super._value as _$_SerializationError;
}

/// @nodoc

class _$_SerializationError extends _SerializationError {
  const _$_SerializationError() : super._();

  @override
  String toString() {
    return 'AppException.serializationError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SerializationError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(CacheException error) cacheError,
    required TResult Function() serializationError,
    required TResult Function(ApiException error) apiError,
    required TResult Function(dynamic error) unknownError,
  }) {
    return serializationError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
  }) {
    return serializationError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
    required TResult orElse(),
  }) {
    if (serializationError != null) {
      return serializationError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_CacheError value) cacheError,
    required TResult Function(_SerializationError value) serializationError,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return serializationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
  }) {
    return serializationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (serializationError != null) {
      return serializationError(this);
    }
    return orElse();
  }
}

abstract class _SerializationError extends AppException {
  const factory _SerializationError() = _$_SerializationError;
  const _SerializationError._() : super._();
}

/// @nodoc
abstract class _$$_ApiErrorCopyWith<$Res> {
  factory _$$_ApiErrorCopyWith(
          _$_ApiError value, $Res Function(_$_ApiError) then) =
      __$$_ApiErrorCopyWithImpl<$Res>;
  $Res call({ApiException error});

  $ApiExceptionCopyWith<$Res> get error;
}

/// @nodoc
class __$$_ApiErrorCopyWithImpl<$Res> extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$_ApiErrorCopyWith<$Res> {
  __$$_ApiErrorCopyWithImpl(
      _$_ApiError _value, $Res Function(_$_ApiError) _then)
      : super(_value, (v) => _then(v as _$_ApiError));

  @override
  _$_ApiError get _value => super._value as _$_ApiError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_ApiError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiException,
    ));
  }

  @override
  $ApiExceptionCopyWith<$Res> get error {
    return $ApiExceptionCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$_ApiError extends _ApiError {
  const _$_ApiError(this.error) : super._();

  @override
  final ApiException error;

  @override
  String toString() {
    return 'AppException.apiError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      __$$_ApiErrorCopyWithImpl<_$_ApiError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(CacheException error) cacheError,
    required TResult Function() serializationError,
    required TResult Function(ApiException error) apiError,
    required TResult Function(dynamic error) unknownError,
  }) {
    return apiError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
  }) {
    return apiError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_CacheError value) cacheError,
    required TResult Function(_SerializationError value) serializationError,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class _ApiError extends AppException {
  const factory _ApiError(final ApiException error) = _$_ApiError;
  const _ApiError._() : super._();

  ApiException get error;
  @JsonKey(ignore: true)
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnknownErrorCopyWith<$Res> {
  factory _$$_UnknownErrorCopyWith(
          _$_UnknownError value, $Res Function(_$_UnknownError) then) =
      __$$_UnknownErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class __$$_UnknownErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$_UnknownErrorCopyWith<$Res> {
  __$$_UnknownErrorCopyWithImpl(
      _$_UnknownError _value, $Res Function(_$_UnknownError) _then)
      : super(_value, (v) => _then(v as _$_UnknownError));

  @override
  _$_UnknownError get _value => super._value as _$_UnknownError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_UnknownError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_UnknownError extends _UnknownError {
  const _$_UnknownError(this.error) : super._();

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AppException.unknownError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnknownError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_UnknownErrorCopyWith<_$_UnknownError> get copyWith =>
      __$$_UnknownErrorCopyWithImpl<_$_UnknownError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkError,
    required TResult Function(CacheException error) cacheError,
    required TResult Function() serializationError,
    required TResult Function(ApiException error) apiError,
    required TResult Function(dynamic error) unknownError,
  }) {
    return unknownError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
  }) {
    return unknownError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkError,
    TResult Function(CacheException error)? cacheError,
    TResult Function()? serializationError,
    TResult Function(ApiException error)? apiError,
    TResult Function(dynamic error)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_CacheError value) cacheError,
    required TResult Function(_SerializationError value) serializationError,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_UnknownError value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_CacheError value)? cacheError,
    TResult Function(_SerializationError value)? serializationError,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_UnknownError value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownError extends AppException {
  const factory _UnknownError(final dynamic error) = _$_UnknownError;
  const _UnknownError._() : super._();

  dynamic get error;
  @JsonKey(ignore: true)
  _$$_UnknownErrorCopyWith<_$_UnknownError> get copyWith =>
      throw _privateConstructorUsedError;
}

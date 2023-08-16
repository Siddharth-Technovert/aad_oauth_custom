// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, Map<String, dynamic> headerResponse)
        success,
    required TResult Function(AppException exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, Map<String, dynamic> headerResponse)? success,
    TResult? Function(AppException exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, Map<String, dynamic> headerResponse)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiSuccess<T> value) success,
    required TResult Function(_ApiError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiSuccess<T> value)? success,
    TResult? Function(_ApiError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiSuccess<T> value)? success,
    TResult Function(_ApiError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ApiSuccessCopyWith<T, $Res> {
  factory _$$_ApiSuccessCopyWith(
          _$_ApiSuccess<T> value, $Res Function(_$_ApiSuccess<T>) then) =
      __$$_ApiSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data, Map<String, dynamic> headerResponse});
}

/// @nodoc
class __$$_ApiSuccessCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$_ApiSuccess<T>>
    implements _$$_ApiSuccessCopyWith<T, $Res> {
  __$$_ApiSuccessCopyWithImpl(
      _$_ApiSuccess<T> _value, $Res Function(_$_ApiSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? headerResponse = null,
  }) {
    return _then(_$_ApiSuccess<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      headerResponse: null == headerResponse
          ? _value._headerResponse
          : headerResponse // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_ApiSuccess<T> extends _ApiSuccess<T> {
  const _$_ApiSuccess(this.data,
      {final Map<String, dynamic> headerResponse = const {}})
      : _headerResponse = headerResponse,
        super._();

  @override
  final T data;
  final Map<String, dynamic> _headerResponse;
  @override
  @JsonKey()
  Map<String, dynamic> get headerResponse {
    if (_headerResponse is EqualUnmodifiableMapView) return _headerResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headerResponse);
  }

  @override
  String toString() {
    return 'ApiResponse<$T>.success(data: $data, headerResponse: $headerResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other._headerResponse, _headerResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_headerResponse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiSuccessCopyWith<T, _$_ApiSuccess<T>> get copyWith =>
      __$$_ApiSuccessCopyWithImpl<T, _$_ApiSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, Map<String, dynamic> headerResponse)
        success,
    required TResult Function(AppException exception) error,
  }) {
    return success(data, headerResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, Map<String, dynamic> headerResponse)? success,
    TResult? Function(AppException exception)? error,
  }) {
    return success?.call(data, headerResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, Map<String, dynamic> headerResponse)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, headerResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiSuccess<T> value) success,
    required TResult Function(_ApiError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiSuccess<T> value)? success,
    TResult? Function(_ApiError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiSuccess<T> value)? success,
    TResult Function(_ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ApiSuccess<T> extends ApiResponse<T> {
  const factory _ApiSuccess(final T data,
      {final Map<String, dynamic> headerResponse}) = _$_ApiSuccess<T>;
  const _ApiSuccess._() : super._();

  T get data;
  Map<String, dynamic> get headerResponse;
  @JsonKey(ignore: true)
  _$$_ApiSuccessCopyWith<T, _$_ApiSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ApiErrorCopyWith<T, $Res> {
  factory _$$_ApiErrorCopyWith(
          _$_ApiError<T> value, $Res Function(_$_ApiError<T>) then) =
      __$$_ApiErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({AppException exception});

  $AppExceptionCopyWith<$Res> get exception;
}

/// @nodoc
class __$$_ApiErrorCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$_ApiError<T>>
    implements _$$_ApiErrorCopyWith<T, $Res> {
  __$$_ApiErrorCopyWithImpl(
      _$_ApiError<T> _value, $Res Function(_$_ApiError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_ApiError<T>(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppExceptionCopyWith<$Res> get exception {
    return $AppExceptionCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$_ApiError<T> extends _ApiError<T> {
  const _$_ApiError(this.exception) : super._();

  @override
  final AppException exception;

  @override
  String toString() {
    return 'ApiResponse<$T>.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiError<T> &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiErrorCopyWith<T, _$_ApiError<T>> get copyWith =>
      __$$_ApiErrorCopyWithImpl<T, _$_ApiError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data, Map<String, dynamic> headerResponse)
        success,
    required TResult Function(AppException exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data, Map<String, dynamic> headerResponse)? success,
    TResult? Function(AppException exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data, Map<String, dynamic> headerResponse)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiSuccess<T> value) success,
    required TResult Function(_ApiError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiSuccess<T> value)? success,
    TResult? Function(_ApiError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiSuccess<T> value)? success,
    TResult Function(_ApiError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ApiError<T> extends ApiResponse<T> {
  const factory _ApiError(final AppException exception) = _$_ApiError<T>;
  const _ApiError._() : super._();

  AppException get exception;
  @JsonKey(ignore: true)
  _$$_ApiErrorCopyWith<T, _$_ApiError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

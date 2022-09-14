// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(AppException exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppException exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataSuccess<T> value) success,
    required TResult Function(_DataError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DataSuccess<T> value)? success,
    TResult Function(_DataError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataSuccess<T> value)? success,
    TResult Function(_DataError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateCopyWith<T, $Res> {
  factory $DataStateCopyWith(
          DataState<T> value, $Res Function(DataState<T>) then) =
      _$DataStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$DataStateCopyWithImpl<T, $Res> implements $DataStateCopyWith<T, $Res> {
  _$DataStateCopyWithImpl(this._value, this._then);

  final DataState<T> _value;
  // ignore: unused_field
  final $Res Function(DataState<T>) _then;
}

/// @nodoc
abstract class _$$_DataSuccessCopyWith<T, $Res> {
  factory _$$_DataSuccessCopyWith(
          _$_DataSuccess<T> value, $Res Function(_$_DataSuccess<T>) then) =
      __$$_DataSuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$_DataSuccessCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements _$$_DataSuccessCopyWith<T, $Res> {
  __$$_DataSuccessCopyWithImpl(
      _$_DataSuccess<T> _value, $Res Function(_$_DataSuccess<T>) _then)
      : super(_value, (v) => _then(v as _$_DataSuccess<T>));

  @override
  _$_DataSuccess<T> get _value => super._value as _$_DataSuccess<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_DataSuccess<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_DataSuccess<T> extends _DataSuccess<T> {
  const _$_DataSuccess(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'DataState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_DataSuccessCopyWith<T, _$_DataSuccess<T>> get copyWith =>
      __$$_DataSuccessCopyWithImpl<T, _$_DataSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(AppException exception) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppException exception)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DataSuccess<T> value) success,
    required TResult Function(_DataError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DataSuccess<T> value)? success,
    TResult Function(_DataError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataSuccess<T> value)? success,
    TResult Function(_DataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DataSuccess<T> extends DataState<T> {
  const factory _DataSuccess(final T data) = _$_DataSuccess<T>;
  const _DataSuccess._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$_DataSuccessCopyWith<T, _$_DataSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DataErrorCopyWith<T, $Res> {
  factory _$$_DataErrorCopyWith(
          _$_DataError<T> value, $Res Function(_$_DataError<T>) then) =
      __$$_DataErrorCopyWithImpl<T, $Res>;
  $Res call({AppException exception});

  $AppExceptionCopyWith<$Res> get exception;
}

/// @nodoc
class __$$_DataErrorCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements _$$_DataErrorCopyWith<T, $Res> {
  __$$_DataErrorCopyWithImpl(
      _$_DataError<T> _value, $Res Function(_$_DataError<T>) _then)
      : super(_value, (v) => _then(v as _$_DataError<T>));

  @override
  _$_DataError<T> get _value => super._value as _$_DataError<T>;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$_DataError<T>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }

  @override
  $AppExceptionCopyWith<$Res> get exception {
    return $AppExceptionCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$_DataError<T> extends _DataError<T> {
  const _$_DataError(this.exception) : super._();

  @override
  final AppException exception;

  @override
  String toString() {
    return 'DataState<$T>.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataError<T> &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_DataErrorCopyWith<T, _$_DataError<T>> get copyWith =>
      __$$_DataErrorCopyWithImpl<T, _$_DataError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(AppException exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(AppException exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
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
    required TResult Function(_DataSuccess<T> value) success,
    required TResult Function(_DataError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DataSuccess<T> value)? success,
    TResult Function(_DataError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DataSuccess<T> value)? success,
    TResult Function(_DataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _DataError<T> extends DataState<T> {
  const factory _DataError(final AppException exception) = _$_DataError<T>;
  const _DataError._() : super._();

  AppException get exception;
  @JsonKey(ignore: true)
  _$$_DataErrorCopyWith<T, _$_DataError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

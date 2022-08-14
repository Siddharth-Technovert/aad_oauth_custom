// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cache_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CacheException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchError,
    required TResult Function() insertError,
    required TResult Function() deleteError,
    required TResult Function() updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchError value) fetchError,
    required TResult Function(_InsertError value) insertError,
    required TResult Function(_DeleteError value) deleteError,
    required TResult Function(_UpdateError value) updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheExceptionCopyWith<$Res> {
  factory $CacheExceptionCopyWith(
          CacheException value, $Res Function(CacheException) then) =
      _$CacheExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$CacheExceptionCopyWithImpl<$Res>
    implements $CacheExceptionCopyWith<$Res> {
  _$CacheExceptionCopyWithImpl(this._value, this._then);

  final CacheException _value;
  // ignore: unused_field
  final $Res Function(CacheException) _then;
}

/// @nodoc
abstract class _$$_FetchErrorCopyWith<$Res> {
  factory _$$_FetchErrorCopyWith(
          _$_FetchError value, $Res Function(_$_FetchError) then) =
      __$$_FetchErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchErrorCopyWithImpl<$Res>
    extends _$CacheExceptionCopyWithImpl<$Res>
    implements _$$_FetchErrorCopyWith<$Res> {
  __$$_FetchErrorCopyWithImpl(
      _$_FetchError _value, $Res Function(_$_FetchError) _then)
      : super(_value, (v) => _then(v as _$_FetchError));

  @override
  _$_FetchError get _value => super._value as _$_FetchError;
}

/// @nodoc

class _$_FetchError extends _FetchError {
  const _$_FetchError() : super._();

  @override
  String toString() {
    return 'CacheException.fetchError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchError,
    required TResult Function() insertError,
    required TResult Function() deleteError,
    required TResult Function() updateError,
  }) {
    return fetchError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
  }) {
    return fetchError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchError value) fetchError,
    required TResult Function(_InsertError value) insertError,
    required TResult Function(_DeleteError value) deleteError,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return fetchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
  }) {
    return fetchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError(this);
    }
    return orElse();
  }
}

abstract class _FetchError extends CacheException {
  const factory _FetchError() = _$_FetchError;
  const _FetchError._() : super._();
}

/// @nodoc
abstract class _$$_InsertErrorCopyWith<$Res> {
  factory _$$_InsertErrorCopyWith(
          _$_InsertError value, $Res Function(_$_InsertError) then) =
      __$$_InsertErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InsertErrorCopyWithImpl<$Res>
    extends _$CacheExceptionCopyWithImpl<$Res>
    implements _$$_InsertErrorCopyWith<$Res> {
  __$$_InsertErrorCopyWithImpl(
      _$_InsertError _value, $Res Function(_$_InsertError) _then)
      : super(_value, (v) => _then(v as _$_InsertError));

  @override
  _$_InsertError get _value => super._value as _$_InsertError;
}

/// @nodoc

class _$_InsertError extends _InsertError {
  const _$_InsertError() : super._();

  @override
  String toString() {
    return 'CacheException.insertError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InsertError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchError,
    required TResult Function() insertError,
    required TResult Function() deleteError,
    required TResult Function() updateError,
  }) {
    return insertError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
  }) {
    return insertError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
    required TResult orElse(),
  }) {
    if (insertError != null) {
      return insertError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchError value) fetchError,
    required TResult Function(_InsertError value) insertError,
    required TResult Function(_DeleteError value) deleteError,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return insertError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
  }) {
    return insertError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (insertError != null) {
      return insertError(this);
    }
    return orElse();
  }
}

abstract class _InsertError extends CacheException {
  const factory _InsertError() = _$_InsertError;
  const _InsertError._() : super._();
}

/// @nodoc
abstract class _$$_DeleteErrorCopyWith<$Res> {
  factory _$$_DeleteErrorCopyWith(
          _$_DeleteError value, $Res Function(_$_DeleteError) then) =
      __$$_DeleteErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteErrorCopyWithImpl<$Res>
    extends _$CacheExceptionCopyWithImpl<$Res>
    implements _$$_DeleteErrorCopyWith<$Res> {
  __$$_DeleteErrorCopyWithImpl(
      _$_DeleteError _value, $Res Function(_$_DeleteError) _then)
      : super(_value, (v) => _then(v as _$_DeleteError));

  @override
  _$_DeleteError get _value => super._value as _$_DeleteError;
}

/// @nodoc

class _$_DeleteError extends _DeleteError {
  const _$_DeleteError() : super._();

  @override
  String toString() {
    return 'CacheException.deleteError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchError,
    required TResult Function() insertError,
    required TResult Function() deleteError,
    required TResult Function() updateError,
  }) {
    return deleteError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
  }) {
    return deleteError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
    required TResult orElse(),
  }) {
    if (deleteError != null) {
      return deleteError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchError value) fetchError,
    required TResult Function(_InsertError value) insertError,
    required TResult Function(_DeleteError value) deleteError,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return deleteError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
  }) {
    return deleteError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (deleteError != null) {
      return deleteError(this);
    }
    return orElse();
  }
}

abstract class _DeleteError extends CacheException {
  const factory _DeleteError() = _$_DeleteError;
  const _DeleteError._() : super._();
}

/// @nodoc
abstract class _$$_UpdateErrorCopyWith<$Res> {
  factory _$$_UpdateErrorCopyWith(
          _$_UpdateError value, $Res Function(_$_UpdateError) then) =
      __$$_UpdateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateErrorCopyWithImpl<$Res>
    extends _$CacheExceptionCopyWithImpl<$Res>
    implements _$$_UpdateErrorCopyWith<$Res> {
  __$$_UpdateErrorCopyWithImpl(
      _$_UpdateError _value, $Res Function(_$_UpdateError) _then)
      : super(_value, (v) => _then(v as _$_UpdateError));

  @override
  _$_UpdateError get _value => super._value as _$_UpdateError;
}

/// @nodoc

class _$_UpdateError extends _UpdateError {
  const _$_UpdateError() : super._();

  @override
  String toString() {
    return 'CacheException.updateError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchError,
    required TResult Function() insertError,
    required TResult Function() deleteError,
    required TResult Function() updateError,
  }) {
    return updateError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
  }) {
    return updateError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchError,
    TResult Function()? insertError,
    TResult Function()? deleteError,
    TResult Function()? updateError,
    required TResult orElse(),
  }) {
    if (updateError != null) {
      return updateError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchError value) fetchError,
    required TResult Function(_InsertError value) insertError,
    required TResult Function(_DeleteError value) deleteError,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return updateError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
  }) {
    return updateError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchError value)? fetchError,
    TResult Function(_InsertError value)? insertError,
    TResult Function(_DeleteError value)? deleteError,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (updateError != null) {
      return updateError(this);
    }
    return orElse();
  }
}

abstract class _UpdateError extends CacheException {
  const factory _UpdateError() = _$_UpdateError;
  const _UpdateError._() : super._();
}

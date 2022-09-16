// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) available,
    required TResult Function() notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? available,
    TResult Function()? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? available,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NotAvailable value) notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$$_AvailableCopyWith<$Res> {
  factory _$$_AvailableCopyWith(
          _$_Available value, $Res Function(_$_Available) then) =
      __$$_AvailableCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AvailableCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_AvailableCopyWith<$Res> {
  __$$_AvailableCopyWithImpl(
      _$_Available _value, $Res Function(_$_Available) _then)
      : super(_value, (v) => _then(v as _$_Available));

  @override
  _$_Available get _value => super._value as _$_Available;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_Available(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Available extends _Available {
  const _$_Available(this.user) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.available(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Available &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_AvailableCopyWith<_$_Available> get copyWith =>
      __$$_AvailableCopyWithImpl<_$_Available>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) available,
    required TResult Function() notAvailable,
  }) {
    return available(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? available,
    TResult Function()? notAvailable,
  }) {
    return available?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? available,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NotAvailable value) notAvailable,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
  }) {
    return available?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available extends UserState {
  const factory _Available(final User user) = _$_Available;
  const _Available._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$_AvailableCopyWith<_$_Available> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotAvailableCopyWith<$Res> {
  factory _$$_NotAvailableCopyWith(
          _$_NotAvailable value, $Res Function(_$_NotAvailable) then) =
      __$$_NotAvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotAvailableCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_NotAvailableCopyWith<$Res> {
  __$$_NotAvailableCopyWithImpl(
      _$_NotAvailable _value, $Res Function(_$_NotAvailable) _then)
      : super(_value, (v) => _then(v as _$_NotAvailable));

  @override
  _$_NotAvailable get _value => super._value as _$_NotAvailable;
}

/// @nodoc

class _$_NotAvailable extends _NotAvailable {
  const _$_NotAvailable() : super._();

  @override
  String toString() {
    return 'UserState.notAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) available,
    required TResult Function() notAvailable,
  }) {
    return notAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? available,
    TResult Function()? notAvailable,
  }) {
    return notAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? available,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Available value) available,
    required TResult Function(_NotAvailable value) notAvailable,
  }) {
    return notAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
  }) {
    return notAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Available value)? available,
    TResult Function(_NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable(this);
    }
    return orElse();
  }
}

abstract class _NotAvailable extends UserState {
  const factory _NotAvailable() = _$_NotAvailable;
  const _NotAvailable._() : super._();
}

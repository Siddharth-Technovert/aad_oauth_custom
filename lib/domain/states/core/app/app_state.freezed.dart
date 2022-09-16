// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onboarding,
    required TResult Function() unAuthenticated,
    required TResult Function(User user) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Onboarding value) onboarding,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'AppState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onboarding,
    required TResult Function() unAuthenticated,
    required TResult Function(User user) authenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Onboarding value) onboarding,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends AppState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_OnboardingCopyWith<$Res> {
  factory _$$_OnboardingCopyWith(
          _$_Onboarding value, $Res Function(_$_Onboarding) then) =
      __$$_OnboardingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnboardingCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_OnboardingCopyWith<$Res> {
  __$$_OnboardingCopyWithImpl(
      _$_Onboarding _value, $Res Function(_$_Onboarding) _then)
      : super(_value, (v) => _then(v as _$_Onboarding));

  @override
  _$_Onboarding get _value => super._value as _$_Onboarding;
}

/// @nodoc

class _$_Onboarding extends _Onboarding {
  const _$_Onboarding() : super._();

  @override
  String toString() {
    return 'AppState.onboarding()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Onboarding);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onboarding,
    required TResult Function() unAuthenticated,
    required TResult Function(User user) authenticated,
  }) {
    return onboarding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
  }) {
    return onboarding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (onboarding != null) {
      return onboarding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Onboarding value) onboarding,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return onboarding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
  }) {
    return onboarding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (onboarding != null) {
      return onboarding(this);
    }
    return orElse();
  }
}

abstract class _Onboarding extends AppState {
  const factory _Onboarding() = _$_Onboarding;
  const _Onboarding._() : super._();
}

/// @nodoc
abstract class _$$_UnAuthenticatedCopyWith<$Res> {
  factory _$$_UnAuthenticatedCopyWith(
          _$_UnAuthenticated value, $Res Function(_$_UnAuthenticated) then) =
      __$$_UnAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnAuthenticatedCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res>
    implements _$$_UnAuthenticatedCopyWith<$Res> {
  __$$_UnAuthenticatedCopyWithImpl(
      _$_UnAuthenticated _value, $Res Function(_$_UnAuthenticated) _then)
      : super(_value, (v) => _then(v as _$_UnAuthenticated));

  @override
  _$_UnAuthenticated get _value => super._value as _$_UnAuthenticated;
}

/// @nodoc

class _$_UnAuthenticated extends _UnAuthenticated {
  const _$_UnAuthenticated() : super._();

  @override
  String toString() {
    return 'AppState.unAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onboarding,
    required TResult Function() unAuthenticated,
    required TResult Function(User user) authenticated,
  }) {
    return unAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
  }) {
    return unAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Onboarding value) onboarding,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticated extends AppState {
  const factory _UnAuthenticated() = _$_UnAuthenticated;
  const _UnAuthenticated._() : super._();
}

/// @nodoc
abstract class _$$_AuthenticatedCopyWith<$Res> {
  factory _$$_AuthenticatedCopyWith(
          _$_Authenticated value, $Res Function(_$_Authenticated) then) =
      __$$_AuthenticatedCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AuthenticatedCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_AuthenticatedCopyWith<$Res> {
  __$$_AuthenticatedCopyWithImpl(
      _$_Authenticated _value, $Res Function(_$_Authenticated) _then)
      : super(_value, (v) => _then(v as _$_Authenticated));

  @override
  _$_Authenticated get _value => super._value as _$_Authenticated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_Authenticated(
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

class _$_Authenticated extends _Authenticated {
  const _$_Authenticated(this.user) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'AppState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Authenticated &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_AuthenticatedCopyWith<_$_Authenticated> get copyWith =>
      __$$_AuthenticatedCopyWithImpl<_$_Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onboarding,
    required TResult Function() unAuthenticated,
    required TResult Function(User user) authenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onboarding,
    TResult Function()? unAuthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Onboarding value) onboarding,
    required TResult Function(_UnAuthenticated value) unAuthenticated,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onboarding value)? onboarding,
    TResult Function(_UnAuthenticated value)? unAuthenticated,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated extends AppState {
  const factory _Authenticated(final User user) = _$_Authenticated;
  const _Authenticated._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedCopyWith<_$_Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

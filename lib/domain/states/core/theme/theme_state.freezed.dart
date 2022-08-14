// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Light value) light,
    required TResult Function(_Dark value) dark,
    required TResult Function(_System value) system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;
}

/// @nodoc
abstract class _$$_LightCopyWith<$Res> {
  factory _$$_LightCopyWith(_$_Light value, $Res Function(_$_Light) then) =
      __$$_LightCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LightCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$$_LightCopyWith<$Res> {
  __$$_LightCopyWithImpl(_$_Light _value, $Res Function(_$_Light) _then)
      : super(_value, (v) => _then(v as _$_Light));

  @override
  _$_Light get _value => super._value as _$_Light;
}

/// @nodoc

class _$_Light extends _Light {
  const _$_Light() : super._();

  @override
  String toString() {
    return 'ThemeState.light()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Light);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) {
    return light();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) {
    return light?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Light value) light,
    required TResult Function(_Dark value) dark,
    required TResult Function(_System value) system,
  }) {
    return light(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
  }) {
    return light?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class _Light extends ThemeState {
  const factory _Light() = _$_Light;
  const _Light._() : super._();
}

/// @nodoc
abstract class _$$_DarkCopyWith<$Res> {
  factory _$$_DarkCopyWith(_$_Dark value, $Res Function(_$_Dark) then) =
      __$$_DarkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DarkCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$$_DarkCopyWith<$Res> {
  __$$_DarkCopyWithImpl(_$_Dark _value, $Res Function(_$_Dark) _then)
      : super(_value, (v) => _then(v as _$_Dark));

  @override
  _$_Dark get _value => super._value as _$_Dark;
}

/// @nodoc

class _$_Dark extends _Dark {
  const _$_Dark() : super._();

  @override
  String toString() {
    return 'ThemeState.dark()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Dark);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) {
    return dark();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) {
    return dark?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Light value) light,
    required TResult Function(_Dark value) dark,
    required TResult Function(_System value) system,
  }) {
    return dark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
  }) {
    return dark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(this);
    }
    return orElse();
  }
}

abstract class _Dark extends ThemeState {
  const factory _Dark() = _$_Dark;
  const _Dark._() : super._();
}

/// @nodoc
abstract class _$$_SystemCopyWith<$Res> {
  factory _$$_SystemCopyWith(_$_System value, $Res Function(_$_System) then) =
      __$$_SystemCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SystemCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$$_SystemCopyWith<$Res> {
  __$$_SystemCopyWithImpl(_$_System _value, $Res Function(_$_System) _then)
      : super(_value, (v) => _then(v as _$_System));

  @override
  _$_System get _value => super._value as _$_System;
}

/// @nodoc

class _$_System extends _System {
  const _$_System() : super._();

  @override
  String toString() {
    return 'ThemeState.system()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_System);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) {
    return system();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) {
    return system?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (system != null) {
      return system();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Light value) light,
    required TResult Function(_Dark value) dark,
    required TResult Function(_System value) system,
  }) {
    return system(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
  }) {
    return system?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    TResult Function(_System value)? system,
    required TResult orElse(),
  }) {
    if (system != null) {
      return system(this);
    }
    return orElse();
  }
}

abstract class _System extends ThemeState {
  const factory _System() = _$_System;
  const _System._() : super._();
}

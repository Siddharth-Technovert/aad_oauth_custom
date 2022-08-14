// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserContext _$UserContextFromJson(Map<String, dynamic> json) {
  return _UserContext.fromJson(json);
}

/// @nodoc
mixin _$UserContext {
  String? get id => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  AccountType? get accountType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserContextCopyWith<UserContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContextCopyWith<$Res> {
  factory $UserContextCopyWith(
          UserContext value, $Res Function(UserContext) then) =
      _$UserContextCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? displayName,
      String? profileImage,
      AccountType? accountType});
}

/// @nodoc
class _$UserContextCopyWithImpl<$Res> implements $UserContextCopyWith<$Res> {
  _$UserContextCopyWithImpl(this._value, this._then);

  final UserContext _value;
  // ignore: unused_field
  final $Res Function(UserContext) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? profileImage = freezed,
    Object? accountType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserContextCopyWith<$Res>
    implements $UserContextCopyWith<$Res> {
  factory _$$_UserContextCopyWith(
          _$_UserContext value, $Res Function(_$_UserContext) then) =
      __$$_UserContextCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? displayName,
      String? profileImage,
      AccountType? accountType});
}

/// @nodoc
class __$$_UserContextCopyWithImpl<$Res> extends _$UserContextCopyWithImpl<$Res>
    implements _$$_UserContextCopyWith<$Res> {
  __$$_UserContextCopyWithImpl(
      _$_UserContext _value, $Res Function(_$_UserContext) _then)
      : super(_value, (v) => _then(v as _$_UserContext));

  @override
  _$_UserContext get _value => super._value as _$_UserContext;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? profileImage = freezed,
    Object? accountType = freezed,
  }) {
    return _then(_$_UserContext(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserContext implements _UserContext {
  const _$_UserContext(
      {this.id, this.displayName, this.profileImage, this.accountType});

  factory _$_UserContext.fromJson(Map<String, dynamic> json) =>
      _$$_UserContextFromJson(json);

  @override
  final String? id;
  @override
  final String? displayName;
  @override
  final String? profileImage;
  @override
  final AccountType? accountType;

  @override
  String toString() {
    return 'UserContext(id: $id, displayName: $displayName, profileImage: $profileImage, accountType: $accountType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserContext &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other.profileImage, profileImage) &&
            const DeepCollectionEquality()
                .equals(other.accountType, accountType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(profileImage),
      const DeepCollectionEquality().hash(accountType));

  @JsonKey(ignore: true)
  @override
  _$$_UserContextCopyWith<_$_UserContext> get copyWith =>
      __$$_UserContextCopyWithImpl<_$_UserContext>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserContextToJson(this);
  }
}

abstract class _UserContext implements UserContext {
  const factory _UserContext(
      {final String? id,
      final String? displayName,
      final String? profileImage,
      final AccountType? accountType}) = _$_UserContext;

  factory _UserContext.fromJson(Map<String, dynamic> json) =
      _$_UserContext.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get profileImage => throw _privateConstructorUsedError;
  @override
  AccountType? get accountType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserContextCopyWith<_$_UserContext> get copyWith =>
      throw _privateConstructorUsedError;
}

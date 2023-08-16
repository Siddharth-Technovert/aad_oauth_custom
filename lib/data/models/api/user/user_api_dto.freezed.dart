// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_api_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserApiDto _$UserApiDtoFromJson(Map<String, dynamic> json) {
  return _UserApiDto.fromJson(json);
}

/// @nodoc
mixin _$UserApiDto {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  AccountType get accountType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserApiDtoCopyWith<UserApiDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserApiDtoCopyWith<$Res> {
  factory $UserApiDtoCopyWith(
          UserApiDto value, $Res Function(UserApiDto) then) =
      _$UserApiDtoCopyWithImpl<$Res, UserApiDto>;
  @useResult
  $Res call(
      {String? id, String name, String? profileImage, AccountType accountType});
}

/// @nodoc
class _$UserApiDtoCopyWithImpl<$Res, $Val extends UserApiDto>
    implements $UserApiDtoCopyWith<$Res> {
  _$UserApiDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? profileImage = freezed,
    Object? accountType = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserApiDtoCopyWith<$Res>
    implements $UserApiDtoCopyWith<$Res> {
  factory _$$_UserApiDtoCopyWith(
          _$_UserApiDto value, $Res Function(_$_UserApiDto) then) =
      __$$_UserApiDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String name, String? profileImage, AccountType accountType});
}

/// @nodoc
class __$$_UserApiDtoCopyWithImpl<$Res>
    extends _$UserApiDtoCopyWithImpl<$Res, _$_UserApiDto>
    implements _$$_UserApiDtoCopyWith<$Res> {
  __$$_UserApiDtoCopyWithImpl(
      _$_UserApiDto _value, $Res Function(_$_UserApiDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? profileImage = freezed,
    Object? accountType = null,
  }) {
    return _then(_$_UserApiDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserApiDto extends _UserApiDto {
  const _$_UserApiDto(
      {this.id,
      required this.name,
      this.profileImage,
      required this.accountType})
      : super._();

  factory _$_UserApiDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserApiDtoFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? profileImage;
  @override
  final AccountType accountType;

  @override
  String toString() {
    return 'UserApiDto(id: $id, name: $name, profileImage: $profileImage, accountType: $accountType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserApiDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, profileImage, accountType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserApiDtoCopyWith<_$_UserApiDto> get copyWith =>
      __$$_UserApiDtoCopyWithImpl<_$_UserApiDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserApiDtoToJson(
      this,
    );
  }
}

abstract class _UserApiDto extends UserApiDto {
  const factory _UserApiDto(
      {final String? id,
      required final String name,
      final String? profileImage,
      required final AccountType accountType}) = _$_UserApiDto;
  const _UserApiDto._() : super._();

  factory _UserApiDto.fromJson(Map<String, dynamic> json) =
      _$_UserApiDto.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get profileImage;
  @override
  AccountType get accountType;
  @override
  @JsonKey(ignore: true)
  _$$_UserApiDtoCopyWith<_$_UserApiDto> get copyWith =>
      throw _privateConstructorUsedError;
}

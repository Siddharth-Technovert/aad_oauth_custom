// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserApiDto _$$_UserApiDtoFromJson(Map<String, dynamic> json) =>
    _$_UserApiDto(
      id: json['id'] as String?,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String?,
      accountType: $enumDecode(_$AccountTypeEnumMap, json['accountType']),
    );

Map<String, dynamic> _$$_UserApiDtoToJson(_$_UserApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'accountType': _$AccountTypeEnumMap[instance.accountType]!,
    };

const _$AccountTypeEnumMap = {
  AccountType.facebook: 'facebook',
  AccountType.google: 'google',
  AccountType.guest: 'guest',
};

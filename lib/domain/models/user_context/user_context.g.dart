// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserContext _$$_UserContextFromJson(Map<String, dynamic> json) =>
    _$_UserContext(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      profileImage: json['profileImage'] as String?,
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
    );

Map<String, dynamic> _$$_UserContextToJson(_$_UserContext instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'profileImage': instance.profileImage,
      'accountType': _$AccountTypeEnumMap[instance.accountType],
    };

const _$AccountTypeEnumMap = {
  AccountType.facebook: 'facebook',
  AccountType.google: 'google',
  AccountType.guest: 'guest',
};

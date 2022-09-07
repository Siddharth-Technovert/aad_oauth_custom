// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String?,
      accountType: $enumDecode(_$AccountTypeEnumMap, json['accountType']),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'accountType': _$AccountTypeEnumMap[instance.accountType],
    };

const _$AccountTypeEnumMap = {
  AccountType.facebook: 'facebook',
  AccountType.google: 'google',
  AccountType.guest: 'guest',
};

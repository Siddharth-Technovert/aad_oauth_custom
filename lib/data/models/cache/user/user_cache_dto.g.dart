// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cache_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCacheDtoAdapter extends TypeAdapter<UserCacheDto> {
  @override
  final int typeId = 0;

  @override
  UserCacheDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCacheDto(
      id: fields[0] as String?,
      name: fields[1] as String,
      profileImage: fields[2] as String?,
      accountType: fields[3] as String,
      syncTime: fields[4] as String?,
      isSynced: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCacheDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profileImage)
      ..writeByte(3)
      ..write(obj.accountType)
      ..writeByte(4)
      ..write(obj.syncTime)
      ..writeByte(5)
      ..write(obj.isSynced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCacheDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

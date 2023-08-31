import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/mappers/cache_dto.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../../domain/models/user/user.dart';
import '../../api/user/user_api_dto.dart';

part 'user_cache_dto.g.dart';

@HiveType(typeId: AppConstants.userAdapterId)
class UserCacheDto with HiveObjectMixin implements CacheDto<User, UserApiDto> {
  static String boxKey = AppConstants.userBoxKey;

  @HiveField(0)
  String? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? profileImage;

  @HiveField(3)
  String accountType;

  @override
  @HiveField(4)
  String? syncTime;

  @override
  @HiveField(5)
  bool? isSynced;

  UserCacheDto({
    this.id,
    required this.name,
    this.profileImage,
    required this.accountType,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number => id.toString(); // change id to your unique identifier

  @override
  User toModel() => User(
        id: id,
        name: name,
        profileImage: profileImage,
        accountType: AccountType.values.firstWhere(
          (e) => e.name == accountType,
          orElse: () => AccountType.guest,
        ),
      );

  @override
  UserApiDto toApiDto() => UserApiDto(
        id: id,
        name: name,
        profileImage: profileImage,
        accountType: AccountType.values.firstWhere(
          (e) => e.name == accountType,
          orElse: () => AccountType.guest,
        ),
      );
}

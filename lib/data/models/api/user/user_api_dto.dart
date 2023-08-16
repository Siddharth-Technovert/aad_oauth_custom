import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/mappers/api_dto.dart';
import '../../../../domain/enums/account_type.dart';
import '../../cache/user/user_cache_dto.dart';

part 'user_api_dto.freezed.dart';
part 'user_api_dto.g.dart';

@freezed
class UserApiDto with _$UserApiDto implements ApiCacheDto<UserCacheDto> {
  const factory UserApiDto({
    String? id,
    required String name,
    String? profileImage,
    required AccountType accountType,
  }) = _UserApiDto;
  const UserApiDto._();

  factory UserApiDto.fromJson(Map<String, dynamic> json) =>
      _$UserApiDtoFromJson(json);

  @override
  UserCacheDto toCacheDto() => UserCacheDto(
        id: id,
        name: name,
        profileImage: profileImage,
        accountType: accountType.name,
      );
}

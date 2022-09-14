import '../../data/models/api/user/user_api_dto.dart';

class AppSerializers {
  static final Map<dynamic, Function(Map<String, dynamic> val)> serializers = {
    //TODO: Add serializers for each dto

    UserApiDto: (data) => UserApiDto.fromJson(data),
  };
}

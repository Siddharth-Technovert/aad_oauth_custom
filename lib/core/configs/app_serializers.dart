import '../../data/models/api/user/user_api_dto.dart';
import '../utils/api/dto_serializers.dart';

class AppSerializer {
  static void init() {
    DtoSerializers(
      {
        UserApiDto: UserApiDto.fromJson,
      },
    );
  }
}

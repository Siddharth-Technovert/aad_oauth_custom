import '../../data/models/api/article/article_api_dto.dart';
import '../../data/models/api/user/user_api_dto.dart';
import '../utils/api/dto_serializers.dart';

class AppSerializer {
  static void init() {
    DtoSerializers(
      {
        UserApiDto: UserApiDto.fromJson,
        ArticleResponseApiDto: ArticleResponseApiDto.fromJson,
        ArticleApiDto: ArticleApiDto.fromJson,
        ArticleSourceApiDto: ArticleSourceApiDto.fromJson,
      },
    );
  }
}

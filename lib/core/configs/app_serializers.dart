import '../../data/models/api/article/article_api_dto.dart';
import '../../data/models/api/user/user_api_dto.dart';
import '../utils/errors/app_exception.dart';

class AppSerializer {
  static T fromJson<T>(Map<String, dynamic> json) {
    return switch (T) {
      UserApiDto => UserApiDto.fromJson(json) as T,
      ArticleResponseApiDto => ArticleResponseApiDto.fromJson(json) as T,
      ArticleApiDto => ArticleApiDto.fromJson(json) as T,
      ArticleSourceApiDto => ArticleSourceApiDto.fromJson(json) as T,
      //?Add API DTO hers
      _ => throw const AppExceptionSerializationError(),
    };
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/mappers/api_dto.dart';
import '../../../../domain/models/article/article.dart';

part 'article_api_dto.freezed.dart';
part 'article_api_dto.g.dart';

@freezed
class ArticleResponseApiDto with _$ArticleResponseApiDto implements ToJson {
  const factory ArticleResponseApiDto({
    String? status,
    int? totalResults,
    List<ArticleApiDto>? articles,
  }) = _ArticleResponseApiDto;
  const ArticleResponseApiDto._();

  factory ArticleResponseApiDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseApiDtoFromJson(json);
}

@freezed
class ArticleApiDto with _$ArticleApiDto implements ApiDto<Article> {
  const factory ArticleApiDto({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _ArticleApiDto;
  const ArticleApiDto._();

  factory ArticleApiDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleApiDtoFromJson(json);

  @override
  Article toModel() => Article(
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      );
}

@freezed
class ArticleSourceApiDto
    with _$ArticleSourceApiDto
    implements ApiDto<ArticleSource> {
  const factory ArticleSourceApiDto({
    String? id,
    String? name,
  }) = _ArticleSourceApiDto;
  const ArticleSourceApiDto._();

  factory ArticleSourceApiDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceApiDtoFromJson(json);

  @override
  ArticleSource toModel() => ArticleSource(
        id: id,
        name: name,
      );
}

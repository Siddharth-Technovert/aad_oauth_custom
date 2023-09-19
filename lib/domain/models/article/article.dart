import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/mappers/ui_model.dart';
import '../../../data/models/api/article/article_api_dto.dart';

part 'article.freezed.dart';

@freezed
class Article with _$Article implements UIModel<ArticleApiDto> {
  const factory Article({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _Article;
  const Article._();

  @override
  ArticleApiDto toApiDto() => throw UnimplementedError();
}

@freezed
class ArticleSource
    with _$ArticleSource
    implements UIModel<ArticleSourceApiDto> {
  const factory ArticleSource({
    String? id,
    String? name,
  }) = _ArticleSource;
  const ArticleSource._();

  @override
  ArticleSourceApiDto toApiDto() => throw UnimplementedError();
}

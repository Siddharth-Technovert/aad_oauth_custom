// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleResponseApiDto _$$_ArticleResponseApiDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleResponseApiDto(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticleApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArticleResponseApiDtoToJson(
        _$_ArticleResponseApiDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

_$_ArticleApiDto _$$_ArticleApiDtoFromJson(Map<String, dynamic> json) =>
    _$_ArticleApiDto(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_ArticleApiDtoToJson(_$_ArticleApiDto instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

_$_ArticleSourceApiDto _$$_ArticleSourceApiDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleSourceApiDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_ArticleSourceApiDtoToJson(
        _$_ArticleSourceApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

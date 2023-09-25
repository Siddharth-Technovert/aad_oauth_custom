import 'package:flutter/foundation.dart';

import '../../core/utils/errors/app_exception.dart';
import '../models/article/article.dart';

@immutable
sealed class NewsByCategoryState {
  const NewsByCategoryState();
}

final class NewsByCategoryStateInitial extends NewsByCategoryState {
  const NewsByCategoryStateInitial();
}

final class NewsByCategoryStateLoading extends NewsByCategoryState {
  const NewsByCategoryStateLoading({this.news});
  final List<Article>? news;
}

final class NewsByCategoryStateLoaded extends NewsByCategoryState {
  const NewsByCategoryStateLoaded({required this.news});
  final List<Article> news;

  @override
  String toString() => 'NewsByCategoryStateLoaded(news: $news)';
}

final class NewsByCategoryStateError extends NewsByCategoryState {
  const NewsByCategoryStateError(this.ex);
  final AppException ex;

  @override
  String toString() => 'NewsByCategoryStateError(ex: $ex)';
}

extension NewsByCategoryStateExtension on NewsByCategoryState {}

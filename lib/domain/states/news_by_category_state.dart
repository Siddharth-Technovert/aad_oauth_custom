import '../../core/utils/errors/app_exception.dart';
import '../models/article/article.dart';

sealed class NewsByCategoryState {}

class NewsByCategoryStateInitial implements NewsByCategoryState {
  const NewsByCategoryStateInitial();
}

class NewsByCategoryStateLoading implements NewsByCategoryState {
  const NewsByCategoryStateLoading({this.news});
  final List<Article>? news;
}

class NewsByCategoryStateLoaded implements NewsByCategoryState {
  const NewsByCategoryStateLoaded({required this.news});
  final List<Article> news;

  @override
  String toString() => 'TopHeadlinesStateLoaded(headlines: $news)';
}

class NewsByCategoryStateError implements NewsByCategoryState {
  const NewsByCategoryStateError(this.ex);
  final AppException ex;

  @override
  String toString() => 'TopHeadlinesStateError(ex: $ex)';
}

extension NewsByCategoryStateExtension on NewsByCategoryState {}

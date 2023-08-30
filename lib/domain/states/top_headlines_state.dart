import '../../core/utils/errors/app_exception.dart';
import '../models/article/article.dart';

sealed class TopHeadlinesState {}

class TopHeadlinesStateInitial implements TopHeadlinesState {
  const TopHeadlinesStateInitial();
}

class TopHeadlinesStateLoaded implements TopHeadlinesState {
  const TopHeadlinesStateLoaded({required this.headlines});
  final List<Article> headlines;

  @override
  String toString() => 'TopHeadlinesStateLoaded(headlines: $headlines)';
}

class TopHeadlinesStateError implements TopHeadlinesState {
  const TopHeadlinesStateError(this.ex);
  final AppException ex;

  @override
  String toString() => 'TopHeadlinesStateError(ex: $ex)';
}

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/extensions/ref_extensions.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/models/article/article.dart';
import '../../../domain/states/news_by_category_state.dart';
import '../../../domain/usecases/news/news_usecases.dart';

const List<String> categories = [
  "All",
  "Business",
  "Entertainment",
  "General",
  "Health",
  "Science",
  "Sports",
  "Technology",
];

final categorySelectionChipsProvider = StateProvider.autoDispose<String>((ref) {
  return categories[0];
});

final newsByCategoryProvider = StateNotifierProvider.autoDispose<
    NewsByCategoryNotifier, NewsByCategoryState>((ref) {
  return NewsByCategoryNotifier(ref);
});

class NewsByCategoryNotifier extends StateNotifier<NewsByCategoryState> {
  final Ref _ref;
  late final CancelToken _cancelToken = _ref.cancelToken();
  late final NewsByCategory _topHeadlines =
      _ref.watch(newsByCategoryUseCaseProvider);

  NewsByCategoryNotifier(this._ref)
      : super(const NewsByCategoryStateInitial()) {
    getNewsByCategory();
  }

  Future<void> getNewsByCategory({String? category}) async {
    // List<Article>? oldNews;
    // if (state is NewsByCategoryStateLoaded) {
    //   oldNews = (state as NewsByCategoryStateLoaded).news;
    // }
    // state = NewsByCategoryStateLoading(news: oldNews);
    state = const NewsByCategoryStateLoading();
    final dataState = await _topHeadlines(
      NewsByCategoryParam(
        cancelToken: _cancelToken,
        category: category == categories[0] ? null : category,
      ),
    );
    switch (dataState) {
      case DataStateSuccess<List<Article>>(data: var articles):
        state = NewsByCategoryStateLoaded(news: articles);
      case DataStateError<List<Article>>(ex: var ex):
        state = NewsByCategoryStateError(ex);
    }
  }
}

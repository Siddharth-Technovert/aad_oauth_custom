import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/extensions/ref_extensions.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/models/article/article.dart';
import '../../../domain/states/news_by_category_state.dart';
import '../../../domain/usecases/news/news_usecases.dart';

part 'news_by_category_provider.g.dart';

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

@riverpod
class CategorySelectionChipsNotifier extends _$CategorySelectionChipsNotifier {
  @override
  String build() {
    return categories[0];
  }

  void updateTo(String category) {
    state = category;
  }
}

@riverpod
class NewsByCategoryNotifier extends _$NewsByCategoryNotifier {
  late final _cancelToken = ref.cancelToken();

  late final NewsByCategory _topHeadlines =
      ref.watch(newsByCategoryUseCaseProvider);

  @override
  NewsByCategoryState build() {
    getNewsByCategory();
    return const NewsByCategoryStateLoading();
  }

  Future<void> getNewsByCategory({String? category}) async {
    // List<Article>? oldNews;
    // if (state is NewsByCategoryStateLoaded) {
    //   oldNews = (state as NewsByCategoryStateLoaded).news;
    // }
    // state = NewsByCategoryStateLoading(news: oldNews);
    state = const NewsByCategoryStateLoading();
    //? Below await was for testing but can be used as debounced also
    //? await Future.delayed(const Duration(seconds: 5));
    if (!_cancelToken.isCancelled) {
      final dataState = await _topHeadlines(
        NewsByCategoryParam(
          cancelToken: _cancelToken,
          category: category == categories[0] ? null : category,
        ),
      );
      if (!_cancelToken.isCancelled) {
        switch (dataState) {
          case DataStateSuccess<List<Article>>(data: var articles):
            state = NewsByCategoryStateLoaded(news: articles);
          case DataStateError<List<Article>>(ex: var ex):
            state = NewsByCategoryStateError(ex);
        }
      }
    }
  }
}

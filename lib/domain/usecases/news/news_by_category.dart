part of 'news_usecases.dart';

@Riverpod(keepAlive: true)
NewsByCategory newsByCategoryUseCase(NewsByCategoryUseCaseRef ref) {
  return NewsByCategory(ref.watch(newsRepositoryProvider));
}

class NewsByCategory
    extends UseCase<DataState<List<Article>>, NewsByCategoryParam> {
  final NewsRepository _newsRepository;
  NewsByCategory(this._newsRepository);

  @override
  Future<DataState<List<Article>>> call(NewsByCategoryParam param) async {
    return await _newsRepository.newsByCategory(
      param.cancelToken,
      param.category,
    );
  }
}

class NewsByCategoryParam {
  final CancelToken? cancelToken;
  final String? category;
  NewsByCategoryParam({
    this.cancelToken,
    this.category,
  });
}

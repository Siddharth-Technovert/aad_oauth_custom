import 'package:dio/dio.dart';

import '../../core/utils/api/response/api_response.dart';
import '../../domain/models/article/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../data_source/remote/news_remote_data_source.dart';
import '../models/api/article/article_api_dto.dart';
import '../models/result/data_state.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _newsRemoteDataSource;
  NewsRepositoryImpl(this._newsRemoteDataSource);
  @override
  Future<DataState<List<Article>>> newsByCategory(
    CancelToken? cancelToken,
    String? category,
  ) async {
    final topHeadlineResponse =
        await _newsRemoteDataSource.newsByCategory(cancelToken, category);
    switch (topHeadlineResponse) {
      case ApiResponseSuccess<ArticleResponseApiDto>(
          data: ArticleResponseApiDto res
        ):
        return DataStateSuccess(
            res.articles?.map((e) => e.toModel()).toList() ?? []);
      case ApiResponseError<ArticleResponseApiDto>(ex: var ex):
        return DataStateError(ex);
    }
  }
}

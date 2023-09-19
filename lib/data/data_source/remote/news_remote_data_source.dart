import 'package:dio/dio.dart';

import '../../../core/configs/app_configuration.dart';
import '../../../core/utils/api/api_manager/api_manager.dart';
import '../../../core/utils/api/response/api_response.dart';
import '../../enums/endpoints.dart';
import '../../models/api/article/article_api_dto.dart';

class NewsRemoteDataSource {
  final ApiManager _apiManager;
  NewsRemoteDataSource(this._apiManager);

  Future<ApiResponse<ArticleResponseApiDto>> newsByCategory(
    CancelToken? cancelToken,
    String? category,
  ) async {
    final param = {
      "country": "in",
      "apiKey": AppConfiguration.apiKey,
    };
    if (category != null) {
      param.addEntries([MapEntry("category", category)]);
    }
    return _apiManager.getAsync<ArticleResponseApiDto>(
      endpoint: EndPoints.topHeadlines.val(),
      queryParams: param,
      cancelToken: cancelToken,
    );
  }
}

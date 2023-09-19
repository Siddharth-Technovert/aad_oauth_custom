import 'package:dio/dio.dart';

import '../../data/models/result/data_state.dart';
import '../models/article/article.dart';

abstract interface class NewsRepository {
  Future<DataState<List<Article>>> newsByCategory(
    CancelToken? cancelToken,
    String? category,
  );
}

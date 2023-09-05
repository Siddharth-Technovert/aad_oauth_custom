import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/configs/usecase.dart';
import '../../../data/models/result/data_state.dart';
import '../../models/article/article.dart';
import '../../repositories/news_repository.dart';
import '../../service_providers.dart';

part 'news_by_category.dart';
part 'news_usecases.g.dart';

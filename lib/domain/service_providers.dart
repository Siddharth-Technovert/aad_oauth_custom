import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_service_providers.dart';
import '../data/repositories_impl/auth_repository_impl.dart';
import '../data/repositories_impl/news_repository_impl.dart';
import '../data/repositories_impl/user_repository_impl.dart';
import 'repositories/auth_repository.dart';
import 'repositories/news_repository.dart';
import 'repositories/user_repository.dart';

///http repository providers
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    ref.watch(userRemoteDataSourceProvider),
    ref.watch(userLocalDataSourceProvider),
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(userRepositoryProvider));
});
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepositoryImpl(ref.watch(newsRemoteDataSourceProvider));
});

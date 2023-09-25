import 'package:flutter/foundation.dart';

@immutable
sealed class HomeState {
  const HomeState();
}

final class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

final class HomeStateLoggedOut extends HomeState {
  const HomeStateLoggedOut();
}

extension HomeStateExtension on HomeState {
  bool get isLoggedOut => switch (this) {
        HomeStateInitial() => false,
        HomeStateLoggedOut() => true,
      };
}

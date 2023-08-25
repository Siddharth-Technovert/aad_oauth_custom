sealed class HomeState {}

class HomeStateInitial implements HomeState {
  const HomeStateInitial();
}

class HomeStateLoggedOut implements HomeState {
  const HomeStateLoggedOut();
}

extension HomeStateExtension on HomeState {
  bool get isLoggedOut => switch (this) {
        HomeStateInitial() => false,
        HomeStateLoggedOut() => true,
      };
}

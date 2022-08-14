abstract class UseCase<T, P> {
  const UseCase() : super();
  Future<T> call(P params);
}

abstract class NoParamsUseCase<T> {
  const NoParamsUseCase() : super();
  Future<T> call();
}

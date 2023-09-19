import '../../../core/utils/errors/app_exception.dart';

sealed class DataState<T> {}

class DataStateSuccess<T> implements DataState<T> {
  const DataStateSuccess(this.data);
  final T data;
}

class DataStateError<T> implements DataState<T> {
  const DataStateError(this.ex);
  final AppException ex;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/errors/app_exception.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const DataState._();
  const factory DataState.success(T data) = _DataSuccess<T>;
  const factory DataState.error(AppException exception) = _DataError;
}

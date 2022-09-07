import 'api_dto.dart';

abstract class UIModel<T extends ApiDto<UIModel<T>>> {
  T toApiDto();
}

abstract class UICacheModel<T> {
  T toCacheDto();
}

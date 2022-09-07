import 'ui_model.dart';

abstract class ToJson {
  Map<String, dynamic> toJson();
}

abstract class ApiDto<T extends UIModel<ApiDto<T>>> implements ToJson {
  @override
  Map<String, dynamic> toJson();
  T toModel();
}

abstract class ApiCacheDto<T> implements ToJson {
  @override
  Map<String, dynamic> toJson();
  T toCacheDto();
}

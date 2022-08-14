abstract class ApiDto<UIModel> {
  Map<String, dynamic> toJson();
  UIModel toModel();
}

abstract class ApiCacheDto<CacheDto> {
  Map<String, dynamic> toJson();
  CacheDto toCacheDto();
}

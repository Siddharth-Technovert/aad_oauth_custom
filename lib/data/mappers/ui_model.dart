abstract class UIModel<ApiDto> {
  ApiDto toApiDto();
}

abstract class UICacheModel<CacheDto> {
  CacheDto toCacheDto();
}

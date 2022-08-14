abstract class CacheDto<UIModel, ApiDto> {
  UIModel toModel();
  ApiDto toApiDto();

  // String get boxKey;
  String get number; // This is unique key for each entity
  String? syncTime;
  bool? isSynced;
}

import 'api_dto.dart';
import 'ui_model.dart';

abstract class CacheDto<T extends UICacheModel, P extends ApiCacheDto> {
  T toModel();
  P toApiDto();

  // String get boxKey;
  String get number; // This is unique key for each entity
  String? syncTime;
  bool? isSynced;
}

//? 1 iteration
// class A<T extends A<T>> {}

// class B extends A<B> {}

//? 2 iteration
// class A <T extends C<A<T>>> {}

// class B {}

// class C<T extends A<C<T>>> {}

//? 3 iteration
// class A <T extends B<A<B>,C<B>>>{}

// class B <T extends A<B<T,Q>>,Q extends C<B<T,Q>>> {}

// class C <T extends B<A<B<A,C>>,C<B<A,C>>>> {}

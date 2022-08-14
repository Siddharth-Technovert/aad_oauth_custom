import '../../domain/models/user_context/user_context.dart';

class AppSerializers {
  static final Map<dynamic, Function(Map<String, dynamic> val)> serializers = {
    UserContext: (data) => UserContext.fromJson(data),

    //TODO: Add serializers for each dto
    // PostDto: (data) => PostDto.fromJson(data),
  };

  static final Map<dynamic, Function(List val)> listSerializers = {
    //TODO: Add serializers for each dto list
    // List<PostDto>: (data) => data
    //     .map((json) => PostDto.fromJson(json as Map<String, dynamic>))
    //     .toList(),
  };
}

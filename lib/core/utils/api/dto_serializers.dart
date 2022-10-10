typedef Serializer = Function(Map<String, dynamic> val);

class DtoSerializers {
  static final Map<dynamic, Serializer> serializers = {};

  DtoSerializers(Map<dynamic, Serializer> serializersMap) {
    serializersMap.forEach(
      (model, serializer) {
        if (!serializers.containsKey(model)) {
          serializers[model] = serializer;
        }
      },
    );
  }
}

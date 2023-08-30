import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  name: 'Env',
  path: '.env',
  obfuscate: true,
)
abstract class Env {
  const Env();

  //TODO: Please note this base url should end with "/"
  @EnviedField(varName: 'BASE_URL')
  static String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'API_KEY')
  static String apiKey = _Env.apiKey;
}

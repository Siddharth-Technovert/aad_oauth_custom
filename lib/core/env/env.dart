import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(name: 'Env', path: '.env', obfuscate: true)
abstract class Env {
  const Env();

  @EnviedField(varName: 'BASE_URL_KEY')
  static String baseUrlKey = _Env.baseUrlKey;
}

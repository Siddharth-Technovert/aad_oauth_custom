abstract class ValidatorsUtil {
  static bool isValidEmail(String email) {
    final _emailRegEx = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );
    return _emailRegEx.hasMatch(email);
  }
}

abstract class ValidatorsUtil {
  static bool isValidEmail(String email) {
    final emailRegEx = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );
    return emailRegEx.hasMatch(email);
  }
}

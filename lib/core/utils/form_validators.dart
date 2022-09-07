import 'extensions/validation_extensions.dart';

class FormValidator {
  const FormValidator._();

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email can not be empty";
    } else if (!email.isValidEmail) {
      return "Enter valid email";
    }
    return null;
  }

  static String? fullNameValidator(String? fullName) {
    if (fullName == null || fullName.isEmpty) return 'Name can not be empty';
    if (!fullName.isValidFullName) return 'Enter valid name';
    return null;
  }

  static String? addressValidator(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address can not be empty';
    }
    if (address.length < 10) {
      return 'Address should be of length greater then 10';
    }
    return null;
  }

  static String? mobileNumberValidator(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.isEmpty) {
      return 'Mobile number can not be empty';
    }
    if (!mobileNumber.isValidPhoneNumber) {
      return 'Phone number should be of length 10';
    }
    return null;
  }

  static String? identificationNumberValidator(String? identificationNumber) {
    if (identificationNumber == null || identificationNumber.isEmpty) {
      return 'Identification number can not be empty';
    }
    if (!identificationNumber.isValidPhoneNumber) {
      return 'Identification number should be of length 10';
    }
    return null;
  }
}

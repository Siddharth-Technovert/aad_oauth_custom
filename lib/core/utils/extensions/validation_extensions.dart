extension ValidationExtension on String {
  bool get isValidEmail {
    final emailRegEx = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return emailRegEx.hasMatch(this);
  }

  bool get isValidPhoneNumber {
    final phoneNumberRegEx = RegExp(
      r'^([+]?\d{1,2}[.-\s]?)?(\d{3}[.-]?){2}\d{4}$',
    );
    return phoneNumberRegEx.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^\S+(?: \S+)*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidFullName {
    final fullNameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return fullNameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>',
    );
    return passwordRegExp.hasMatch(this);
  }
}

class ValidationHelpers {
  static String? checkISNullOrEmpty(String? inputText) {
    if (inputText == null || inputText.isEmpty || inputText.trim().isEmpty) {
      return "Enter Valid Data";
    }
    return null;
  }

  static String? validateEmail(String? inputText) {
    String? nullableEmail = checkISNullOrEmpty(inputText);
    if (nullableEmail != null) {
      return nullableEmail;
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(inputText!);

    if (!emailValid) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    String? nullablePassword = checkISNullOrEmpty(password);
    if (nullablePassword != null) {
      return nullablePassword;
    }
    final bool validPassword =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password!);

    if (!validPassword) {
      return 'invalid Password';
    }

    return null;
  }

  //Name Validation

  static String? validateName(String? name) {
    String? nullableName = checkISNullOrEmpty(name);
    if (nullableName != null) {
      return (nullableName);
    }
    if (name!.length < 3) {
      return 'Name Must contain atleat 3 characters';
    }
    return null;
  }

  static String? isConfirmValidPassword(String? password,String? confirmPassword) {

    String? nullablePassword = checkISNullOrEmpty(confirmPassword);

    if (nullablePassword != null && confirmPassword == password) {
      return nullablePassword;
    }
    final bool validPassword =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password!);


    if (!validPassword) {
      return 'invalid Password';
    }

    return null;
  }

   static bool isPhonevalid(String phoneNumber) {
    final RegExp regex = RegExp(r'^\d{10}$');
    return (regex.hasMatch(phoneNumber));
  }

  static String? validatePhone(String? phoneNumber) {
    bool isValidPhone = isPhonevalid(phoneNumber!);
    String? nullablePhone = checkISNullOrEmpty(phoneNumber);
    if (nullablePhone != null) {
      return nullablePhone;
    } else if (!isValidPhone) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}

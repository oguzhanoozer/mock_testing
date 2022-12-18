class Validator {
  static String? validateEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.contains("@")) {
        return null;
      } else {
        return "Email must be contains '@'";
      }
    } else {
      return "Email can not be empty";
    }
  }

  static String? validatePassword(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length > 6) {
        return null;
      } else {
        return "Password must be more 6 character";
      }
    } else {
      return "Password can not be empty";
    }
  }
}

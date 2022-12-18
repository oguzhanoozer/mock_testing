import 'package:flutter_mockito_testing/login/product/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Email Validator", () {
    test("Null Email Test", () {
      String? emailText;
      var validatorText = Validator.validateEmail(emailText);
      expect(validatorText, "Email can not be empty");
    });
    test("Empty Email Test", () {
      var validatorText = Validator.validateEmail("");
      expect(validatorText, "Email can not be empty");
    });

    test("Invalid Email Test", () {
      var validatorText = Validator.validateEmail("oguz.gmail.com");
      expect(validatorText, "Email must be contains '@'");
    });
    test("Valid Email Test", () {
      var validatorText = Validator.validateEmail("oguz@gmail.com");
      expect(validatorText, null);
    });
  });

  group("Password Validator", () {
    test("Null Passowrd Test", () {
      String? passText;
      var validatorText = Validator.validatePassword(passText);
      expect(validatorText, "Password can not be empty");
    });
    test("Empty Passowrd Test", () {
      var validatorText = Validator.validatePassword("");
      expect(validatorText, "Password can not be empty");
    });
    test("Invalid Passowrd Test", () {
      var validatorText = Validator.validatePassword("123456");
      expect(validatorText, "Password must be more 6 character");
    });
    test("Valid Passowrd Test", () {
      var validatorText = Validator.validatePassword("1234567");
      expect(validatorText, null);
    });
  });
}

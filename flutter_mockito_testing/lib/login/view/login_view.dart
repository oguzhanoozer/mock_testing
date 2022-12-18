import 'package:flutter/material.dart';
import 'package:flutter_mockito_testing/login/product/validator.dart';
import 'package:kartal/kartal.dart';

enum FormType {
  login,
  register,
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _formType = FormType.login;
  String? _email;
  String? _password;
  String _loginStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingLow,
          child: Form(
              key: _formKey,
              child: _buildFormColumn(_email, _formKey, _loginStatus)),
        ),
      ),
    );
  }

  Column _buildFormColumn(
      String? _email, GlobalKey<FormState> _formKey, String _loginStatus) {
    return Column(
      children: [
        _buildEmailField(_email),
        _buildPasswordField(_password),
        _buildSubmitButton(),
        _loginStatus.isEmpty ? SizedBox() : Text(_loginStatus)
      ],
    );
  }

  Widget _buildEmailField(String? email) {
    return TextFormField(
      key: const Key("email"),
      decoration: const InputDecoration(labelText: "Email"),
      onSaved: ((value) => _email = value?.trim()),
      validator: Validator.validateEmail,
    );
  }

  TextFormField _buildPasswordField(String? password) {
    return TextFormField(
      key: const Key("password"),
      decoration: const InputDecoration(labelText: "Password"),
      onSaved: ((value) => _password = value?.trim()),
      obscureText: true,
      validator: Validator.validatePassword,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState != null &&
            _formKey.currentState!.validate()) {
          setState(() {
            _loginStatus = "Login is succesfull";
          });
        }
      },
      child: const Text("Submit"),
    );
  }
}

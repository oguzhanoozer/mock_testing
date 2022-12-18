import 'package:flutter/material.dart';
import 'package:flutter_mockito_testing/login/product/validator.dart';

import '../model/login_model.dart';
import 'package:kartal/kartal.dart';

import 'my_form_text_field.dart';
import 'result_view.dart';

class LoginFormView extends StatefulWidget {
  @override
  _LoginFormViewState createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  final _formKey = GlobalKey<FormState>();
  LoginModel model = LoginModel();

  final _firstNameHint = 'First Name';
  final _lastNameHint = 'Last Name';
  final _emailHint = 'Email';
  final _firstPassHint = 'Password';
  final _lastPassHint = 'Confirm Password';
  final _signUpText = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: _buildFormColumn(halfMediaWidth, context),
    );
  }

  Column _buildFormColumn(double halfMediaWidth, BuildContext context) {
    return Column(
      children: <Widget>[
        _buildNamesRow(halfMediaWidth),
        _buildEmailField(),
        _buildFirstPassField(),
        _buildLastPassField(),
        _buildSubmitButton(context)
      ],
    );
  }

  Container _buildNamesRow(double halfMediaWidth) {
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNameContainer(halfMediaWidth),
          _buildLastNameContainer(halfMediaWidth)
        ],
      ),
    );
  }

  ElevatedButton _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState != null &&
            _formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          context.navigateToPage(ResultView(model: this.model));
        }
      },
      child: _buildSubmitText(),
    );
  }

  Text _buildSubmitText() {
    return Text(
      _signUpText,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  MyTextFormField _buildLastPassField() {
    return MyTextFormField(
      hintText: _lastPassHint,
      isPassword: true,
      validator: (String? value) {
        if (value != null && value.length < 7) {
          return 'Password should be minimum 7 characters';
        } else if (model.password != null && value != model.password) {
          return 'Password not matched';
        }
        return null;
      },
      onSaved: (_) {},
    );
  }

  MyTextFormField _buildFirstPassField() {
    return MyTextFormField(
      hintText: _firstPassHint,
      isPassword: true,
      validator: (String? value) {
        if (value != null && value.length < 7) {
          return 'Password should be minimum 7 characters';
        }
        _formKey.currentState?.save();
        return null;
      },
      onSaved: (String? value) {
        model.password = value;
      },
    );
  }

  MyTextFormField _buildEmailField() {
    return MyTextFormField(
      hintText: _emailHint,
      isEmail: true,
      validator: Validator.validateEmail,
      onSaved: (String? value) {
        model.email = value;
      },
    );
  }

  Container _buildLastNameContainer(double halfMediaWidth) {
    return Container(
      alignment: Alignment.topCenter,
      width: halfMediaWidth,
      child: MyTextFormField(
        hintText: _lastNameHint,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Enter your last name';
          }
          return null;
        },
        onSaved: (String? value) {
          model.lastName = value;
        },
      ),
    );
  }

  Container _buildNameContainer(double halfMediaWidth) {
    return Container(
      alignment: Alignment.topCenter,
      width: halfMediaWidth,
      child: MyTextFormField(
        hintText: _firstNameHint,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Enter your first name';
          }
          return null;
        },
        onSaved: (String? value) {
          model.firstName = value;
        },
      ),
    );
  }
}

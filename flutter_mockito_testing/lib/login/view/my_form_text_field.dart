import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String?) onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: _buildTextFormField(),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(15.0),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: validator,
      obscureText: isPassword ? true : false,
      onSaved: onSaved,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}

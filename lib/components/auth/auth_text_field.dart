import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final bool isPassword;
  final TextEditingController? textEditingController;

  const AuthTextField({
    required this.prefixIcon,
    required this.hintText,
    required this.onSaved,
    required this.validator,
    this.isPassword = false,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
        onSaved: onSaved,
        controller: textEditingController,
        validator: validator,
      ),
    );
  }
}

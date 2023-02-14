import 'package:flutter/material.dart';

import '../components/auth_text_field.dart';

class SignupPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  String id = '';
  String password = '';
  String confirmPassword = '';

  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _appLogoImage(context),
                SizedBox(height: 30),
                _signupForm(context),
                SizedBox(height: 20),
                _loginNavigateButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appLogoImage(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_logo.png'),
      fit: BoxFit.contain,
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }

  Widget _signupForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          AuthTextField(
            prefixIcon: Icon(Icons.person_outline),
            hintText: 'ID',
            onSaved: (val) => {id = val},
            textEditingController: passwordInputController,
            validator: (val) {
              if (val.length < 1) {
                return '아이디를 입력해주세요';
              }
            },
          ),
          SizedBox(height: 15),
          AuthTextField(
            prefixIcon: Icon(Icons.lock_outline_rounded),
            hintText: 'Password',
            onSaved: (val) => {password = val},
            isPassword: true,
            textEditingController: confirmPasswordInputController,
            validator: (val) {
              if (val.length < 1) {
                return '패스워드를 입력해주세요';
              }
            },
          ),
          SizedBox(height: 15),
          AuthTextField(
            prefixIcon: Icon(Icons.lock_outline_rounded),
            hintText: 'Password Verify',
            onSaved: (val) => {confirmPassword = val},
            isPassword: true,
            validator: (val) {
              if (passwordInputController.value.text !=
                  confirmPasswordInputController.value.text) {
                return '패스워드가 일치하지 않습니다';
              }
            },
          ),
          SizedBox(height: 30),
          _signupSubmitButton(context),
        ],
      ),
    );
  }

  Widget _signupSubmitButton(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.lightGreen,
        ),
        child: Center(child: Text("Sign Up")),
      ),
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          // 서버로 회원가입 Post 요청
        }
      },
    );
  }

  Widget _loginNavigateButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?  "),
        InkWell(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

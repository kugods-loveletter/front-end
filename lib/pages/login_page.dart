import 'package:daily_carbon/components/auth_text_field.dart';
import 'package:daily_carbon/pages/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  String id = '';
  String password = '';

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
                _loginForm(context),
                SizedBox(height: 20),
                _signupNavigateButton(context),
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

  Widget _loginForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Text(
                  "Login",
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
            validator: (val) {
              if (val.length < 1) {
                return '패스워드를 입력해주세요';
              }
            },
          ),
          SizedBox(height: 30),
          _loginSubmitButton(context),
        ],
      ),
    );
  }

  Widget _loginSubmitButton(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.lightGreen,
        ),
        child: Center(child: Text("Login")),
      ),
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print("ID: ${id}");
          print("password: ${password}");
        }
      },
    );
  }

  Widget _signupNavigateButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("New to LoveLetter?  "),
        InkWell(
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
          },
        ),
      ],
    );
  }
}

import 'package:daily_carbon/models/letter.dart';
import 'package:daily_carbon/pages/signup_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Login"),
          InkWell(
            child: Container(
              width: 60,
              height: 30,
              color: Colors.lightGreen,
              child: Center(child: Text("Login")),
            ),
            onTap: () async {
              Response response;
              var dio = Dio();
              response = await dio.post('http://10.0.2.2:3000/login', data: {
                'id': 'qwer',
                'password': '123',
              });
              print(response);
            },
          ),
          InkWell(
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
          ),
          InkWell(
            child: Container(
              color: Colors.blue,
              child: Text("Get 요청"),
            ),
            onTap: () async {
              Response response;
              var dio = Dio();
              response = await dio.get('http://10.0.2.2:3000/meetings/7');
              print(Letter.fromJson(response.data[0]).author);
            },
          )
        ],
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("Sign Up"),
        InkWell(
          child: Container(
            width: 60,
            height: 30,
            color: Colors.lightGreen,
            child: Center(child: Text("Sign Up")),
          ),
          onTap: () async {
            Response response;
            var dio = Dio();
            response = await dio.post(
              'http://10.0.2.2:3000/register',
              data: {
                'id': 'qwer',
                'password': '123',
                'name': 'qwert',
              },
            );
            print(response);
          },
        ),
      ],
    ));
  }
}

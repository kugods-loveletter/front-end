import 'package:daily_carbon/pages/auth/login_page.dart';
import 'package:daily_carbon/pages/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F6ED),
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

import 'package:daily_carbon/api/user.dart';
import 'package:daily_carbon/pages/add_receiver_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("등록하기")),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddReceiverPage(),
                  ),
                );
              },
            ),
            InkWell(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("테스트 버튼")),
              ),
              onTap: () async {
                Response response = await getAllUserList();
                print(response.data);
              },
            ),
          ],
        ),
      ),
    );
  }
}

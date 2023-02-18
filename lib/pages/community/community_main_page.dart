import 'package:flutter/material.dart';

class CommunityMainPage extends StatelessWidget {
  const CommunityMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              Text("커뮤니티 메인 페이지")), // body안의 Center 위젯 삭제하고 그 자리에 페이지 구현하면됩니다.
    );
  }
}

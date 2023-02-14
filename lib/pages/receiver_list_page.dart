import 'package:daily_carbon/components/receiver_profile_tile.dart';
import 'package:flutter/material.dart';

class ReceiverListPage extends StatelessWidget {
  const ReceiverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _buildHeader(),
          ReceiverProfileTile(),
          ReceiverProfileTile(),
          ReceiverProfileTile(),
        ],
      ),
    ));
  }

  Widget _buildHeader() {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("따뜻한 편지로 주변의 이웃을 응원해주세요!"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("이웃 목록"),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:daily_carbon/components/send_letter/receiver_profile_tile.dart';
import 'package:daily_carbon/pages/user_profile/received_letter_list_page.dart';
import 'package:flutter/material.dart';

import 'sent_letter_list_page.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            ReceiverProfileTile(),
            _buildSentLetterButton(context),
            SizedBox(height: 10),
            _buildReceivedLetterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSentLetterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.email),
              SizedBox(width: 20),
              Text("보낸 편지함  00통"),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SentLetterListPage()),
          );
        },
      ),
    );
  }

  Widget _buildReceivedLetterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.email),
              SizedBox(width: 20),
              Text("받은 편지함  00통"),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReceivedLetterListPage()),
          );
        },
      ),
    );
  }
}

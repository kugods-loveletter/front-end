import 'package:daily_carbon/components/send_letter/receiver_profile_tile.dart';
import 'package:daily_carbon/pages/send_letter/letter_write_page.dart';
import 'package:flutter/material.dart';

class ReceiverInfoPage extends StatelessWidget {
  const ReceiverInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("편지 보내기"),
                        Icon(Icons.send),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LetterWritePage()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ReceiverProfileTile(),
          ],
        ),
      ),
    );
  }
}

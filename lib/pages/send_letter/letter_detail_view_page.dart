import 'package:daily_carbon/api/letter.dart';
import 'package:daily_carbon/pages/send_letter/send_reply_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LetterDetailViewPage extends StatelessWidget {
  final String id;

  const LetterDetailViewPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      Response response = await ReportLetter(id);
                      if (response.data['status'] == 200) {
                        showToastMessage("Letter successfully reported");
                      }
                    },
                    icon: Icon(Icons.report),
                  ),
                  IconButton(
                    onPressed: () async {
                      Response response = await IncreaseLetterLikeNumber(id);
                      if (response.data['status'] == 200) {
                        showToastMessage("Liked letter");
                      }
                    },
                    icon: Icon(Icons.thumb_up_alt_rounded),
                  ),
                  IconButton(
                    onPressed: () async {
                      Response response = await deleteLetter(id);
                      if (response.data['status'] == 200) {
                        Navigator.pop(
                          context,
                        );
                      }
                    },
                    icon: Icon(Icons.delete_forever_rounded),
                  ),
                ],
              ),
              SizedBox(height: 20),
              FutureBuilder<Response>(
                future: getOneLetter(id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final letter = snapshot.data.data['data'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              letter['title'],
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 20),
                            Text(
                              letter['body'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Spacer(),
              InkWell(
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 193, 193, 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail_outline_rounded),
                      SizedBox(width: 10),
                      Text("Send Reply"),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendReplyPage(
                        letterId: id,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void showToastMessage(msg) {
    Fluttertoast.showToast(
      msg: msg,
    );
  }
}

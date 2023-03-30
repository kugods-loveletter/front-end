import 'package:daily_carbon/api/notice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NoticeDetailPage extends StatelessWidget {
  final String noticeId;

  const NoticeDetailPage({required this.noticeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      Response response = await reportNotice(noticeId);
                      if (response.data['status'] == 200) {
                        showToastMessage("Post successfully reported.");
                      }
                    },
                    icon: Icon(Icons.report),
                  ),
                  IconButton(
                    onPressed: () async {
                      Response response =
                          await increaseNoticeLikeNumber(noticeId);
                      if (response.data['status'] == 200) {
                        showToastMessage("Liked this post!");
                      }
                    },
                    icon: Icon(Icons.thumb_up_alt_rounded),
                  ),
                  IconButton(
                    onPressed: () async {
                      Response response = await deleteNotice(noticeId);
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
                future: getNotice(noticeId),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final notice = snapshot.data.data['data'][0];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notice['title'],
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 20),
                            Text(
                              notice['body'],
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
              SizedBox(height: 10),
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

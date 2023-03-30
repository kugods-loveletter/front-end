import 'package:daily_carbon/api/posting.dart';
import 'package:daily_carbon/pages/send_letter/letter_write_page.dart';
import 'package:daily_carbon/pages/send_letter/receiver_info_edit_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReceiverInfoPage extends StatelessWidget {
  final String postId;

  const ReceiverInfoPage({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () async {
                    Response response = await reportPosting(postId);
                    if (response.data['status'] == 200) {
                      showToastMessage(response.data['data']);
                    }
                  },
                  icon: Icon(Icons.report),
                ),
                IconButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiverInfoEditPage(postId),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {
                    Response response = await deletePosting(postId);
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
              future: getPosting(postId),
              builder:
                  (BuildContext context, AsyncSnapshot<Response> snapshot) {
                if (snapshot.hasData) {
                  final post = snapshot.data?.data['data'][0];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          height: 100,
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Icon(Icons.person),
                                ),
                              ),
                              SizedBox(width: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(post['category'],
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(height: 5),
                                  Container(
                                    width: 230,
                                    child: Text(
                                      post['title'],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            post['body'],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
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
            SizedBox(
              height: 50,
              child: InkWell(
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 193, 193, 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail_outline_rounded),
                      SizedBox(width: 10),
                      Text("Send Letter"),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LetterWritePage(
                        postId: postId,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
          ],
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

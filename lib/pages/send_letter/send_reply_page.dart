import 'package:daily_carbon/api/letter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendReplyPage extends StatelessWidget {
  final String letterId;

  SendReplyPage({required this.letterId});

  final formKey = GlobalKey<FormState>();

  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                _letterSendButton(context),
                _letterForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _letterForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FutureBuilder<Response>(
            future: getOneLetter(letterId),
            builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
              if (snapshot.hasData) {
                final letter = snapshot.data?.data['data'];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: "수신자: Writer of ${letter['title']}",
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
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              onSaved: (val) => {title = val!},
              validator: (val) {
                if (val!.length < 1) {
                  return '제목을 입력해주세요';
                }
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 500,
            child: TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Content',
              ),
              onSaved: (val) => {content = val!},
              validator: (val) {
                if (val!.length < 1) {
                  return '내용을 입력해주세요';
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _letterSendButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            width: 80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 193, 193, 1.0),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send_rounded, size: 40),
              ],
            ),
          ),
          onTap: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              // 서버로 Post 요청
              Response response = await postLetter(letterId, title, content);
              if (response.data['status'] == 200) {
                showToastMessage();
                // 페이지 이동
                Navigator.pop(
                  context,
                );
              }
            }
          },
        ),
      ),
    );
  }

  void showToastMessage() {
    Fluttertoast.showToast(
      msg: "Your letter has been successfully sent.",
    );
  }
}

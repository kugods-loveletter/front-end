import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LetterWritePage extends StatelessWidget {
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
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: "수신자:  홍길동",
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '제목',
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
                hintText: '내용',
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
            width: 100,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send_rounded),
                Text("보내기"),
              ],
            ),
          ),
          onTap: () {
            showToastMessage();
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              // 서버로 Post 요청
              print(title);
              print(content);
              // 페이지 이동
              Navigator.pop(
                context,
              );
            }
          },
        ),
      ),
    );
  }

  void showToastMessage() {
    Fluttertoast.showToast(
      msg: "편지를 성공적으로 전송했습니다.",
    );
  }
}

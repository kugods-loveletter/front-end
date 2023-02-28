import 'package:daily_carbon/components/send_letter/receiver_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LetterWritePage extends StatelessWidget {
  final ReceiverProfileTile receiver;

  LetterWritePage({required this.receiver});

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
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: "수신자:  ${receiver.name}",
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
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xFFbdb3d1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send_rounded, size: 40),
              ],
            ),
          ),
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              showToastMessage();
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

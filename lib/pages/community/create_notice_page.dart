import 'package:daily_carbon/api/notice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateNoticePage extends StatelessWidget {
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
                _noticePostButton(context),
                _noticeForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _noticeForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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

  Widget _noticePostButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 193, 193, 1.0),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.post_add_rounded, size: 25),
                SizedBox(width: 5),
                Text("Post Notice"),
              ],
            ),
          ),
          onTap: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              // 서버로 Post 요청
              Response response = await PostNotice(title, content);
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
      msg: "Notice posted successfully",
    );
  }
}

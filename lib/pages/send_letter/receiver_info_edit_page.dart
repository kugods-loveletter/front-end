import 'package:daily_carbon/api/posting.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ReceiverInfoEditPage extends StatefulWidget {
  final String postId;

  const ReceiverInfoEditPage(this.postId);

  @override
  State<ReceiverInfoEditPage> createState() => _ReceiverInfoEditPageState();
}

class _ReceiverInfoEditPageState extends State<ReceiverInfoEditPage> {
  final formKey = GlobalKey<FormState>();

  String category = 'poverty';
  String name = '';
  String body = '';

  final List<String> _dropdownValues = [
    'depression',
    'poverty',
    'school bullying',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("수신자 등록"),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 20),
              FutureBuilder<Response>(
                future: getPosting(widget.postId),
                builder:
                    (BuildContext context, AsyncSnapshot<Response> snapshot) {
                  if (snapshot.hasData) {
                    final post = snapshot.data?.data['data'][0];
                    return _addReceiverForm(
                        context, post['category'], post['title'], post['body']);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              _receiverAddButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addReceiverForm(BuildContext context, category, title, content) {
    TextEditingController _titleController = TextEditingController(text: title);
    TextEditingController _contentController =
        TextEditingController(text: content);

    return Container(
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                value: category,
                onChanged: (newValue) {
                  setState(() {
                    category = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a value';
                  }
                  return null;
                },
                items: _dropdownValues.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                controller: _titleController,
                onEditingComplete: () {
                  _titleController.text = _titleController.value.text;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                onSaved: (val) => {name = val!},
                validator: (val) {
                  if (val!.length < 1) {
                    return '이름을 입력해주세요';
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.9,
              ),
              child: TextFormField(
                maxLines: 20,
                controller: _contentController,
                onEditingComplete: () {
                  _contentController.text = _contentController.value.text;
                },
                decoration: InputDecoration(
                  labelText: 'Introduction',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                onSaved: (val) => {body = val!},
                validator: (val) {
                  if (val!.length < 1) {
                    return '소개글을 입력해주세요';
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _receiverAddButton(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(243, 193, 193, 1.0),
        ),
        child: Center(child: Text("Edit")),
      ),
      onTap: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Response response = await editPosting(widget.postId, name, body);
          if (response.data['status'] == 200) {
            Navigator.pop(
              context,
            );
          }
        }
      },
    );
  }
}

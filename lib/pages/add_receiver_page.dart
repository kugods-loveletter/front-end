import 'package:flutter/material.dart';

class AddReceiverPage extends StatefulWidget {
  @override
  State<AddReceiverPage> createState() => _AddReceiverPageState();
}

class _AddReceiverPageState extends State<AddReceiverPage> {
  final formKey = GlobalKey<FormState>();

  String category = 'poverty';
  String name = '';
  String intro = '';

  final List<String> _dropdownValues = [
    'depression',
    'poverty',
    'category3',
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
              _addReceiverForm(context),
              SizedBox(height: 20),
              _receiverAddButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addReceiverForm(BuildContext context) {
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
                  labelText: '카테고리',
                  border: OutlineInputBorder(),
                ),
                value: 'depression',
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
                decoration: InputDecoration(
                  labelText: '이름',
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
                decoration: InputDecoration(
                  labelText: '소개글',
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
                onSaved: (val) => {intro = val!},
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
          color: Colors.lightGreen,
        ),
        child: Center(child: Text("등록")),
      ),
      onTap: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.pop(
            context,
          );
        }
      },
    );
  }
}

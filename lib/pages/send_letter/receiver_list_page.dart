import 'package:flutter/material.dart';

import '../../db/receivers.dart';

class ReceiverListPage extends StatefulWidget {
  @override
  State<ReceiverListPage> createState() => _ReceiverListPageState();
}

class _ReceiverListPageState extends State<ReceiverListPage> {
  List filteredReceiverList = receivers;
  String _selectedCategory = 'All Categories';
  String postRequestResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildDropDownFilter(),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredReceiverList.length,
                itemBuilder: (context, index) {
                  return filteredReceiverList[index];
                },
              ),
            ),
            Text("ID: ${postRequestResult}"),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("따뜻한 편지로 주변의 이웃을 응원해주세요!"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("이웃 목록"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropDownFilter() {
    return DropdownButton<String>(
      value: _selectedCategory,
      items: [
        DropdownMenuItem(
            child: Text('All Categories'), value: 'All Categories'),
        DropdownMenuItem(child: Text('depression'), value: 'depression'),
        DropdownMenuItem(child: Text('poverty'), value: 'poverty'),
        DropdownMenuItem(child: Text('Item 3'), value: 'Item 3'),
      ],
      onChanged: (value) {
        setState(() {
          _selectedCategory = value!;
          filteredReceiverList = filterReceiver(_selectedCategory);
        });
      },
    );
  }

  List filterReceiver(String category) {
    if (category == 'All Categories') {
      return receivers;
    } else {
      return receivers.where((receiver) {
        return receiver.category == category;
      }).toList();
    }
  }
}

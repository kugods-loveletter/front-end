import 'package:daily_carbon/api/notice.dart';
import 'package:daily_carbon/pages/community/create_notice_page.dart';
import 'package:daily_carbon/pages/community/notice_detail_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CommunityMainPage extends StatelessWidget {
  const CommunityMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Notices"),
            SizedBox(height: 30),
            FutureBuilder<Response>(
              future: getAllNoticesList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final notices = snapshot.data.data['data'];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: notices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildNoticeTile(
                            notices[index]['title'],
                            notices[index]['body'],
                            notices[index]['_id'],
                            notices[index]['like'],
                            context);
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            InkWell(
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 193, 193, 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.create),
                      SizedBox(width: 10),
                      Text(
                        "Create Notice",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNoticePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticeTile(String title, String body, String id, like, context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoticeDetailPage(noticeId: id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18)),
            SizedBox(height: 3),
            Text(
              body,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Spacer(),
                Icon(Icons.thumb_up_alt_outlined, size: 16),
                SizedBox(width: 5),
                Text("$like"),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
          ],
        ),
      ),
    );
  }
}

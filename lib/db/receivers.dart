import 'package:daily_carbon/api/posting.dart';
import 'package:daily_carbon/components/send_letter/receiver_profile_tile.dart';

Future<List> loadReceivers() async {
  final response = await getAllPostings();
  List tmp = [];
  response.data['data'].forEach((post) {
    final String title = post['title'];
    final String body = post['body'];
    final String category = "depression";
    tmp.add(ReceiverProfileTile(name: title, intro: body, category: category));
  });
  List receivers = tmp;
  return receivers;
}

List receivers = [
  ReceiverProfileTile(name: '이름1', intro: '소개글1', category: 'depression'),
  ReceiverProfileTile(name: '이름2', intro: '소개글2', category: 'depression'),
  ReceiverProfileTile(name: '이름3', intro: '소개글3', category: 'poverty'),
];

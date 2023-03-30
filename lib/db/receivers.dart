import 'package:daily_carbon/api/posting.dart';
import 'package:daily_carbon/components/send_letter/receiver_profile_tile.dart';

Future<List> loadReceivers() async {
  final response = await getAllPostings();
  List tmp = [];
  response.data['data'].forEach((post) {
    final String id = post['_id'];
    final String title = post['title'];
    final String body = post['body'];
    final String category = post['category'] ?? "No Category Found";
    tmp.add(ReceiverProfileTile(
        id: id, name: title, intro: body, category: category));
  });
  List receivers = tmp;
  return receivers;
}

List receivers = [];

import 'package:daily_carbon/api/auth.dart';
import 'package:daily_carbon/api/letter.dart';
import 'package:daily_carbon/components/send_letter/custom_letter_tile.dart';
import 'package:daily_carbon/config/url.dart';
import 'package:dio/dio.dart';

String url = serverUrl;

Future<Response> getAllUserList() async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/user');
  return response;
}

Future<Response> getOneUser() async {
  Response response;
  var dio = Dio();
  String userId = await getSessionUserId();
  response = await dio.get('$url/api/user/$userId');
  return response;
}

Future<List> getUserSentLettersList() async {
  Response response;
  List tmp = [];
  response = await dio.get('$url/api/user/sent');
  for (final letter in response.data['data']) {
    final String id = letter['_id'];
    final Response response2 = await getOneLetter(id);
    final String title = response2.data['data']['title'];
    final String body = response2.data['data']['body'];
    tmp.add(CustomLetterTile(id: id, title: title, body: body));
  }
  return tmp;
}

Future<List> getUserReceivedLettersList() async {
  Response response;
  List tmp = [];
  response = await dio.get('$url/api/user/received');
  for (final letter in response.data['data']) {
    final String id = letter['_id'];
    final Response response2 = await getOneLetter(id);
    final String title = response2.data['data']['title'];
    final String body = response2.data['data']['body'];
    tmp.add(CustomLetterTile(id: id, title: title, body: body));
  }
  return tmp;
}

import 'package:daily_carbon/config/url.dart';
import 'package:dio/dio.dart';

String url = serverUrl;

Future<Response> getAllUserList() async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/user');
  return response;
}

Future<Response> getOneUser(userId) async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/user/$userId');
  return response;
}

Future<Response> getUserSentLetters() async {
  Response response;
  Response user;
  String userId;
  var dio = Dio();
  user = await dio.get('$url/auth/session');
  userId = user.data['_id'];
  response = await dio.get('$url/api/user/$userId/received');
  return response;
}

Future<Response> getUserReceivedLetters(userId) async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/user/$userId/received');
  return response;
}

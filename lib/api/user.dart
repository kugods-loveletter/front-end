import 'package:dio/dio.dart';

String url = 'http://10.0.2.2:4000';

Future<Response> getAllUserList() async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/user');
  return response;
}

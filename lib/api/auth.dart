import 'package:dio/dio.dart';

String url = 'http://10.0.2.2:4000';

Future<Response> signupPostRequest(id, email, pw, confirmPw) async {
  Response response;
  var dio = Dio();
  response = await dio.post('$url/auth/signup', data: {
    "id": id,
    "email": email,
    "pw": pw,
    "confirmPw": confirmPw,
  });
  return response;
}

Future<Response> loginPostRequest(id, pw) async {
  Response response;
  var dio = Dio();
  response = await dio.post('$url/auth/login', data: {
    "id": id,
    "pw": pw,
  });
  return response;
}

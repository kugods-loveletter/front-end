import 'package:cookie_jar/cookie_jar.dart';
import 'package:daily_carbon/config/url.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

String url = serverUrl;

final dio = Dio();
final cookieJar = CookieJar();

Future<Response> signupPostRequest(id, email, pw, confirmPw) async {
  Response response;
  response = await dio.post('$url/auth/signup', data: {
    "id": id,
    "email": email,
    "pw": pw,
    "confirmPw": confirmPw,
  });
  return response;
}

Future<Response> loginPostRequest(id, pw) async {
  dio.interceptors.add(CookieManager(cookieJar));
  Response response;
  response = await dio.post('$url/auth/login', data: {
    "id": id,
    "pw": pw,
  });
  final cookies = await cookieJar.loadForRequest(Uri.parse(url));
  print(cookies);
  return response;
}

Future<Response> logoutGetRequest() async {
  Response response;
  response = await dio.get('$url/auth/logout');
  return response;
}

Future<String> getSessionUserId() async {
  Response response;
  response = await dio.get('$url/auth/loggedInUser');
  String id = response.data['data']['_id'];
  return id;
}

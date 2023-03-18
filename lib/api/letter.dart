import 'package:dio/dio.dart';

String url = 'http://10.0.2.2:4000';

Future<Response> getOneLetter(letterId) async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/letter/$letterId');
  return response;
}

Future<Response> postLetter(letterId, title, body) async {
  Response response;
  var dio = Dio();
  response = await dio.post('$url/api/letter/$letterId', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> editLetter(letterId, title, body) async {
  Response response;
  var dio = Dio();
  response = await dio.patch('$url/api/letter/$letterId', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> deleteLetter(letterId) async {
  Response response;
  var dio = Dio();
  response = await dio.delete('$url/api/letter/$letterId');
  return response;
}

Future<Response> getAllLetters(letterId) async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/letter/$letterId/allLetters');
  return response;
}

Future<Response> IncreaseLetterLikeNumber(letterId) async {
  Response response;
  var dio = Dio();
  response = await dio.patch('$url/api/letter/$letterId/like');
  return response;
}

Future<Response> ReportLetter(letterId) async {
  Response response;
  var dio = Dio();
  response = await dio.patch('$url/api/letter/$letterId/check');
  return response;
}

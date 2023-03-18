import 'package:dio/dio.dart';

String url = 'http://10.0.2.2:4000';

Future<Response> getAllNotices() async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/notice');
  return response;
}

Future<Response> PostNotice(title, body) async {
  Response response;
  var dio = Dio();
  response = await dio.post('$url/api/notice', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> getNotice(noticeId) async {
  Response response;
  var dio = Dio();
  response = await dio.get('$url/api/notice/$noticeId');
  return response;
}

Future<Response> editNotice(noticeId, title, body) async {
  Response response;
  var dio = Dio();
  response = await dio.patch('$url/api/notice/$noticeId', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> deleteNotice(noticeId) async {
  Response response;
  var dio = Dio();
  response = await dio.delete('$url/api/notice/$noticeId');
  return response;
}

Future<Response> increaseNoticeLikeNumber(noticeId) async {
  Response response;
  var dio = Dio();
  response = await dio.patch('$url/api/notice/$noticeId/like');
  return response;
}

Future<Response> reportNotice(noticeId) async {
  Response response;
  var dio = Dio();
  response = await dio.patch('$url/api/notice/$noticeId/check');
  return response;
}
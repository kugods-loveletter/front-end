import 'package:daily_carbon/api/auth.dart';
import 'package:daily_carbon/config/url.dart';
import 'package:dio/dio.dart';

String url = serverUrl;

Future<Response> getAllNoticesList() async {
  Response response;
  response = await dio.get('$url/api/notice');

  return response;
}

Future<Response> PostNotice(title, body) async {
  Response response;
  response = await dio.post('$url/api/notice', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> getNotice(noticeId) async {
  Response response;

  response = await dio.get('$url/api/notice/$noticeId');
  return response;
}

Future<Response> editNotice(noticeId, title, body) async {
  Response response;

  response = await dio.patch('$url/api/notice/$noticeId', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> deleteNotice(noticeId) async {
  Response response;

  response = await dio.delete('$url/api/notice/$noticeId');
  return response;
}

Future<Response> increaseNoticeLikeNumber(noticeId) async {
  Response response;

  response = await dio.patch('$url/api/notice/$noticeId/like');
  return response;
}

Future<Response> reportNotice(noticeId) async {
  Response response;

  response = await dio.patch('$url/api/notice/$noticeId/check');
  return response;
}

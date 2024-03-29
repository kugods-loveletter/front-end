import 'package:daily_carbon/api/auth.dart';
import 'package:daily_carbon/config/url.dart';
import 'package:dio/dio.dart';

String url = serverUrl;

Future<Response> getAllPostings() async {
  Response response;
  response = await dio.get('$url/api/posting');

  return response;
}

Future<Response> postPosting(category, title, body) async {
  Response response;
  response = await dio.post(
    '$url/api/posting',
    data: {
      "category": category,
      "title": title,
      "body": body,
    },
  );
  return response;
}

Future<Response> getPosting(postingId) async {
  Response response;
  response = await dio.get('$url/api/posting/$postingId');
  return response;
}

Future<Response> editPosting(postingId, title, body) async {
  Response response;
  response = await dio.patch('$url/api/posting/$postingId', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> deletePosting(postingId) async {
  Response response;
  response = await dio.delete('$url/api/posting/$postingId');
  return response;
}

Future<Response> getReplyLetterList(postingId) async {
  Response response;
  response = await dio.get('$url/api/posting/$postingId/replyLetter');
  return response;
}

Future<Response> postReplyLetter(postingId, title, body) async {
  Response response;
  response = await dio.post('$url/api/posting/$postingId/replyLetter', data: {
    "title": title,
    "body": body,
  });
  return response;
}

Future<Response> increasePostingLikeNumber(postingId) async {
  Response response;
  response = await dio.patch('$url/api/posting/$postingId/like');
  return response;
}

Future<Response> reportPosting(postingId) async {
  Response response;
  response = await dio.patch('$url/api/posting/$postingId/check');
  return response;
}

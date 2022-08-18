import 'dart:convert';

import 'package:digital14_task/data/models/events.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../constants/strings.dart';

class EventsWebServices {
  late Dio dio;

  EventsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

/*
Future<List<Events>> getPosts(
      {int page = 1, int limit = 10}) async {
    try {
      var response = await get(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page',
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Post> posts = [];
        body.forEach((e) {
          Post post = Post.fromJson(e);
          posts.add(post);
        });
        return HTTPResponse<List<Post>>(
          true,
          posts,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Post>>(
          false,
          null,
          message:
              'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<Post>>(
        false,
        null,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<Post>>(
        false,
        null,
        message:
            'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      print('UNEXPECTED ERROR');
      print(e.toString());
      return HTTPResponse<List<Post>>(
        false,
        null,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}*/


  Future<List<dynamic>> getAllEventsWeb() async {
    try {
      Response response = await dio.get('');
      return response.data['events'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQuotes(String charName) async {
    try {
      Response response =
          await dio.get('quote', queryParameters: {'author': charName});
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

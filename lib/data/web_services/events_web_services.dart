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

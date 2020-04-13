import 'dart:convert';

import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:http/http.dart' as http;

class LessonApi {
  //Get list lesson by
  //tabName,page,limit
  Future<List<Lesson>> getLessonByTabNamePage(
      String tabName, int page, int limit) async {
    String path = getUrl(tabName, page, limit);
    var response = await http.get(path);
    if (response.statusCode == 200) {
      List<Lesson> lessons = new List<Lesson>();
      List responseJson = json.decode(response.body);
      lessons = responseJson.map((n) => new Lesson.fromJson(n)).toList();
      return lessons;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }

  Future<List<Lesson>> getLessonByTabName(String tabName) async {
    String url = getUrlByTabname(tabName);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<Lesson> lessons = new List<Lesson>();
      List responseJson = json.decode(response.body);
      lessons = responseJson.map((n) => new Lesson.fromJson(n)).toList();
      return lessons;
    } else {
      print("request error: ${response.body}");
      return null;
    }
  }
}

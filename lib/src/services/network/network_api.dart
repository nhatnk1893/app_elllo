import 'dart:convert';

import 'package:app_elllo/src/models/course/course.dart';
import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/models/session/session.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  Future<List<Course>> getCourse(String tabName) async {
    String path = getUrl(tabName);
    var response = await http.get(path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List reponseJson = json.decode(response.body);
      List<Course> course =
          reponseJson.map((n) => new Course.fromJson(n)).toList();
      return course;
    } else {
      return null;
    }
  }

  Future<List<Lesson>> getLesson(String url, String id) async {
    String path = url + "/$id/Lesson";
    var response = await http.get(path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List reponseJson = json.decode(response.body);
      List<Lesson> lesson =
          reponseJson.map((n) => new Lesson.fromJson(n)).toList();
      return lesson;
    } else {
      return null;
    }
  }

  Future<List<Session>> getSession(String url, String id) async {
    String path = url + "/$id/Session";
    var response = await http.get(path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List reponseJson = json.decode(response.body);
      List<Session> session =
          reponseJson.map((n) => new Session.fromJson(n)).toList();
      return session;
    } else {
      return null;
    }
  }
}

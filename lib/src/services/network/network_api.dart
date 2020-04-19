import 'dart:convert';
import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/models/chapter/chapter_api.dart';
import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  //Get category audio
  Future<List<Category>> getCategory(String category) async {
    String path = "$BASE_URL$CATEGORY$category&api_key=$API_KEY";
    var response = await http.get(path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List reponseJson = json.decode(response.body);
      List<Category> course =
          reponseJson.map((n) => new Category.fromJson(n)).toList();
      return course;
    } else {
      return null;
    }
  }

  Future<List<Lesson>> getLesson(String code) async {
    String path = "$BASE_URL$LESSON$code&api_key=$API_KEY";
    var response = await http.get(path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var reponseJson = json.decode(response.body);
      var rest = reponseJson['Lesson'] as List;
      List<Lesson> lesson = rest.map((n) => new Lesson.fromJson(n)).toList();
      return lesson;
    } else {
      return null;
    }
  }

  Future<ChapterApi> getChapter(String id) async {
    String path = "$BASE_URL$CHAPTER$id&api_key=$API_KEY";
    var response = await http.get(path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var reponseJson = json.decode(response.body);
      var rest = reponseJson['Lesson'];
      return ChapterApi.fromJson(rest[0]);
    } else {
      return null;
    }
  }
}

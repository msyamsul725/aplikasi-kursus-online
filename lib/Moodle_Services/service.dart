import 'dart:convert';

import 'package:flutter_hyper_ui/model/courses.dart';
import 'package:http/http.dart' as http;

class ServiceClass {
  final _baseUrl =
      'http://192.168.100.4/moodle/webservice/rest/server.php?wstoken=d58b15a408c84fed772f812462ab4840&wsfunction=core_course_get_recent_courses&moodlewsrestformat=json&userid=2';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Courses> blog = it.map((e) => Courses.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

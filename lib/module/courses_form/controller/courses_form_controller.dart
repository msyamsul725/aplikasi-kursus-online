import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../shared/util/input/input.dart';
import '../view/courses_form_view.dart';

class CoursesFormController extends GetxController {
  CoursesFormView? view;

  doSave() async {
    var instructorName = Input.get("instructor_name");
    var photoInstructor = Input.get("photo_instructor");
    var coursesName = Input.get("courses_name");
    var photoBanner = Input.get("photo_banner");
    var coursesTheme = Input.get("courses_theme");
    var rating = Input.get("rating");
    var description = Input.get("description");
    var price = Input.get("price");
    var videos = Input.get("videos");

    await FirebaseFirestore.instance.collection("courses").add({
      "instructor_name": instructorName,
      "photo_instructor": photoInstructor,
      "courses_name": coursesName,
      "photo_banner": photoBanner,
      "courses_theme": coursesTheme,
      "rating": rating,
      "description": description,
      "price": price,
      "videos": videos,
    });
    Get.back();
  }
}

import 'package:flutter/material.dart';
import '../controller/Edit_Profile_courses_controller.dart';

import 'package:get/get.dart';

class EditProfileCoursesView extends StatelessWidget {
  const EditProfileCoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileCoursesController>(
      init: EditProfileCoursesController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("EditProfileCourses"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
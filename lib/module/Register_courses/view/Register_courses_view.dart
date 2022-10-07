import 'package:flutter/material.dart';
import '../controller/Register_courses_controller.dart';

import 'package:get/get.dart';

class RegisterCoursesView extends StatelessWidget {
  const RegisterCoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterCoursesController>(
      init: RegisterCoursesController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("RegisterCourses"),
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
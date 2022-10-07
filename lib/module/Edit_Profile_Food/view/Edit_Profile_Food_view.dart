import 'package:flutter/material.dart';
import '../controller/Edit_Profile_Food_controller.dart';

import 'package:get/get.dart';

class EditProfileFoodView extends StatelessWidget {
  const EditProfileFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileFoodController>(
      init: EditProfileFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("EditProfileFood"),
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
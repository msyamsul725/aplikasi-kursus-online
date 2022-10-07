import 'package:flutter/material.dart';
import '../controller/Profile_Food_controller.dart';

import 'package:get/get.dart';

class ProfileFoodView extends StatelessWidget {
  const ProfileFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileFoodController>(
      init: ProfileFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("ProfileFood"),
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
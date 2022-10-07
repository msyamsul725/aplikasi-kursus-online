import 'package:flutter/material.dart';
import '../controller/MainNavigation_Food_controller.dart';

import 'package:get/get.dart';

class MainNavigationFoodView extends StatelessWidget {
  const MainNavigationFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationFoodController>(
      init: MainNavigationFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("MainNavigationFood"),
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
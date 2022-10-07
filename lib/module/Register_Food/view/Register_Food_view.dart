import 'package:flutter/material.dart';
import '../controller/Register_Food_controller.dart';

import 'package:get/get.dart';

class RegisterFoodView extends StatelessWidget {
  const RegisterFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterFoodController>(
      init: RegisterFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("RegisterFood"),
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
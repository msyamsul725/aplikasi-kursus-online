import 'package:flutter/material.dart';
import '../controller/Login_Food_controller.dart';

import 'package:get/get.dart';

class LoginFoodView extends StatelessWidget {
  const LoginFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginFoodController>(
      init: LoginFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("LoginFood"),
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
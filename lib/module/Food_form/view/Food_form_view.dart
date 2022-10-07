import 'package:flutter/material.dart';
import '../controller/Food_form_controller.dart';

import 'package:get/get.dart';

class FoodFormView extends StatelessWidget {
  const FoodFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodFormController>(
      init: FoodFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("FoodForm"),
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
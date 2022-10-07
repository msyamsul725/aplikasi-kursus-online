import 'package:flutter/material.dart';
import '../controller/Dashboard_Food_controller.dart';

import 'package:get/get.dart';

class DashboardFoodView extends StatelessWidget {
  const DashboardFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardFoodController>(
      init: DashboardFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("DashboardFood"),
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
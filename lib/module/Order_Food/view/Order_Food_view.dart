import 'package:flutter/material.dart';
import '../controller/Order_Food_controller.dart';

import 'package:get/get.dart';

class OrderFoodView extends StatelessWidget {
  const OrderFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderFoodController>(
      init: OrderFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("OrderFood"),
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
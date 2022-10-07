import 'package:flutter/material.dart';
import '../controller/Favorite_Food_controller.dart';

import 'package:get/get.dart';

class FavoriteFoodView extends StatelessWidget {
  const FavoriteFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteFoodController>(
      init: FavoriteFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("FavoriteFood"),
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
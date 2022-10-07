import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/shared/widget/button/button.dart';
import 'package:flutter_hyper_ui/shared/widget/textfield/textfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:get/get.dart';

import '../../MainNavigation_courses/view/MainNavigation_courses_view.dart';
import '../../Register_courses/view/Register_courses_view.dart';
import '../controller/Login_courses_controller.dart';

class LoginCoursesView extends StatelessWidget {
  const LoginCoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginCoursesController>(
      init: LoginCoursesController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: const Color(0xff1B9CFC),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const ExTextField(
                            id: "email",
                            label: "Email",
                          ),
                          const ExTextField(
                            id: "password",
                            label: "Password",
                          ),
                          ExButton(
                            color: const Color(0xff1B9CFC),
                            onPressed: () =>
                                Get.to(const BasicMainNavigationView()),
                            label: "Login",
                          ),
                          InkWell(
                            onTap: () => Get.to(const RegisterCoursesView()),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Register"),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                icon: const Icon(MdiIcons.google),
                                label: const Text("Google"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff1B9CFC),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () => controller.googleLogin(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

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

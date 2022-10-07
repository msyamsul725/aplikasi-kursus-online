import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../shared/util/input/input.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../MainNavigation_courses/view/MainNavigation_courses_view.dart';
import '../view/Login_courses_view.dart';

class LoginCoursesController extends GetxController {
  LoginCoursesView? view;
  bool isLoging = false;

  doLigin() async {
    var email = Input.get("email");
    var password = Input.get("password");

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (_) {
      Get.snackbar("gagal", "Cek kembali email & password mu");
    }
  }

  void googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      Get.offAll(const BasicMainNavigationView());
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: userCredential");
//TODO: on login success
//------------------
    } catch (_) {}
  }
}

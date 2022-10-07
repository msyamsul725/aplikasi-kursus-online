import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hyper_ui/firebase_options.dart';
import 'package:flutter_hyper_ui/module/splash/view/splash_view.dart';
import 'package:flutter_hyper_ui/shared/util/theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: const SplashView()));
}

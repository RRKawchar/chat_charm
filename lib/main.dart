import 'dart:io';

import 'package:chat_app_demo/src/core/di/app_bindings.dart';
import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/core/theme/app_theme.dart';
import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/splash/view/page/splash_page.dart';
import 'package:chat_app_demo/src/features/welcome/view/page/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 Platform.isAndroid?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDsR3-RaYt5ZUGpBgt0ckCYemP_44dYWD8",
          appId: "1:67114285716:android:fa91b977e5167729439281",
          messagingSenderId: "67114285716",
          projectId: "berber-booking-app"
     )
  ):
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.splashPage,
      getPages: AppRoutes.pageList,
       //home:SplashPage()
       //home:RecordingTest()
    );
  }
}


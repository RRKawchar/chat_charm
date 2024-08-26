import 'package:chat_app_demo/src/core/utils/assets_image.dart';
import 'package:chat_app_demo/src/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find<SplashController>();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsImage.messageIcon,
            width: 150,
            color: Theme.of(context).primaryColor,
          ),
          const Text("Wait...........")
        ],
      ),
    ));
  }
}

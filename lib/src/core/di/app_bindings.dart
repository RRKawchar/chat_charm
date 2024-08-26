import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/image_picker_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings{

  @override
  void dependencies() {
   Get.lazyPut(() => SplashController(),fenix: true);
   Get.lazyPut(() => AuthController(),fenix: true);
   Get.lazyPut(() => ProfileController(),fenix: true);
   Get.lazyPut(() => ImagePickerController(),fenix: true);
  }

}
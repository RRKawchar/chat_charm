import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:chat_app_demo/src/features/call/controller/call_controller.dart';
import 'package:chat_app_demo/src/features/chat/controller/chat_controller.dart';
import 'package:chat_app_demo/src/features/contact/controller/contact_controller.dart';
import 'package:chat_app_demo/src/features/groups/controller/group_controller.dart';
import 'package:chat_app_demo/src/features/home/controller/status_controller.dart';
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
   Get.lazyPut(() => ContactController(),fenix: true);
   Get.lazyPut(() => ChatController(),fenix: true);
   Get.lazyPut(() => GroupController(),fenix: true);
   Get.lazyPut(() => StatusController(),fenix: true);
   Get.lazyPut(() => CallController(),fenix: true);
  }

}
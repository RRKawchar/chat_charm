import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/chat/controller/chat_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioCallPage extends StatelessWidget {
  final UserModel targetUser;
  const AudioCallPage({super.key, required this.targetUser,});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find<ProfileController>();
    ChatController chatController = Get.find<ChatController>();
    var callId=chatController.getRoomId(targetUser.id!);
    return ZegoUIKitPrebuiltCall(
      appID: AppConstants.appId,
      appSign: AppConstants.appSign,
      userID: profileController.currentUserList.value.id ??"root",
      userName: profileController.currentUserList.value.name ??"root",
      callID: callId,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
    );
  }
}

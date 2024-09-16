import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:chat_app_demo/src/features/profile/view/widgets/user_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  const UserProfilePage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final ProfileController profileController = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            UserProfileInfo(
              profileImage:
                  userModel.profilePic ?? AppConstants.defaultProfilePic,
              userName: userModel.name ?? "User Name",
              userEmail: userModel.email ?? "User Email",
            ),
          ],
        ),
      ),
    );
  }
}

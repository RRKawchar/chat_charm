import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:chat_app_demo/src/features/profile/view/widgets/user_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.updateProfilePage);
            },
            icon: const Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const UserProfileInfo(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                authController.logoutUser();
              },
              child: const Text(
                "Logout",
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_demo/src/core/widgets/k_button.dart';
import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/image_picker_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/view/widgets/my_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController =
        Get.find<ImagePickerController>();
    ProfileController profileController = Get.find<ProfileController>();
    AuthController authController = Get.find<AuthController>();

    TextEditingController nameController = TextEditingController(
        text: profileController.currentUserList.value.name);
    TextEditingController emailController = TextEditingController(
        text: profileController.currentUserList.value.email);
    TextEditingController phoneController = TextEditingController(
        text: profileController.currentUserList.value.phoneNumber);
    TextEditingController aboutController = TextEditingController(
        text: profileController.currentUserList.value.about);
    RxBool isEdit = false.obs;
    RxString imagePath = "".obs;



    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logoutUser();
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        MyProfileImage(
                          imagePath: imagePath,
                          isEdit: isEdit,
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => TextField(
                            controller: nameController,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                                filled: isEdit.value,
                                prefixIcon: const Icon(Icons.person),
                                labelText: "Name"),
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          enabled: isEdit.value,
                          decoration: InputDecoration(
                              filled: isEdit.value,
                              prefixIcon: const Icon(Icons.email_outlined),
                              labelText: "Email"),
                        ),
                        Obx(
                          () => TextField(
                            controller: aboutController,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                                filled: isEdit.value,
                                prefixIcon: const Icon(Icons.info),
                                labelText: "About"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => TextField(
                            controller: phoneController,
                            enabled: isEdit.value,
                            decoration: InputDecoration(
                                filled: isEdit.value,
                                prefixIcon: const Icon(Icons.phone),
                                labelText: "Phone"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isEdit.value
                                  ? profileController.isLoading.value
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : KButton(
                                          btnText: "Save",
                                          onTap: () async {
                                            await profileController
                                                .updateProfile(
                                              imageUrl: imagePath.value,
                                              name: nameController.text,
                                              about: aboutController.text,
                                              number: phoneController.text,
                                            );
                                            isEdit.value = false;
                                          },
                                        )
                                  : KButton(
                                      btnText: "Edit",
                                      onTap: () {
                                        isEdit.value = true;
                                      },
                                    ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

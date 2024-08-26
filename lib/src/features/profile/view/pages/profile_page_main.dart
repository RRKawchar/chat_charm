import 'dart:io';
import 'package:chat_app_demo/src/core/widgets/k_button.dart';
import 'package:chat_app_demo/src/features/profile/controller/image_picker_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageMain extends StatelessWidget {
  const ProfilePageMain({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController=Get.find<ProfileController>();
    RxBool isEdit = false.obs;
    TextEditingController nameController =
        TextEditingController(text: profileController.userInfoList.value.name);
    TextEditingController emailController =
        TextEditingController(text: profileController.userInfoList.value.email);
    TextEditingController phoneController = TextEditingController(
        text: profileController.userInfoList.value.phoneNumber);
    TextEditingController aboutController =
        TextEditingController(text: profileController.userInfoList.value.about);
    ImagePickerController imagePickerController =Get.find<ImagePickerController>();
    RxString imagePath = "".obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isEdit.value
                                  ? InkWell(
                                      onTap: () async {
                                        imagePath.value =
                                            await imagePickerController
                                                .pickedImage();
                                      },
                                      child: imagePath.value != ""
                                          ? Container(
                                              height: 180,
                                              width: 180,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.file(
                                                  File(
                                                    imagePath.value,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : CircleAvatar(
                                              radius: 80,
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              child: const Icon(Icons.add),
                                            ),
                                    )
                                  : CircleAvatar(
                                      radius: 80,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      child: const Icon(Icons.image),
                                    ),
                            ),
                          ],
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
                                  ? KButton(
                                      btnText: "Save",
                                      onTap: () {
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

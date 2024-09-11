import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_demo/src/core/widgets/k_button.dart';
import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/image_picker_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController =
        Get.find<ImagePickerController>();
    ProfileController profileController = Get.find<ProfileController>();
    AuthController authController=Get.find<AuthController>();

    TextEditingController nameController =
        TextEditingController(text: profileController.currentUserList.value.name);
    TextEditingController emailController =
        TextEditingController(text: profileController.currentUserList.value.email);
    TextEditingController phoneController = TextEditingController(
        text: profileController.currentUserList.value.phoneNumber);
    TextEditingController aboutController =
        TextEditingController(text: profileController.currentUserList.value.about);
    RxBool isEdit = false.obs;
    RxString imagePath = "".obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(onPressed: (){
            authController.logoutUser();
          }, icon: const Icon(Icons.logout))
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
                              () =>isEdit.value
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
                                  :profileController.currentUserList.value.profilePic ==null ||
                                          profileController.currentUserList.value.profilePic == ""
                                      ? CircleAvatar(
                                          radius: 80,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          child: const Icon(
                                            Icons.image,
                                            size: 60,
                                          ))
                                      :
                                     ClipRRect(
                                          borderRadius:BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            imageUrl: profileController.currentUserList.value.profilePic.toString(),
                                            width: 180,
                                            height: 180,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          ),


                                          // Image.network(
                                          //   profileController
                                          //       .currentUserList.value.profilePic
                                          //       .toString(),
                                          //   width: 180,
                                          //   height: 180,
                                          //   fit: BoxFit.fill,
                                          // ),




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
                                  ? profileController.isLoading.value?
                                  const Center(child: CircularProgressIndicator(),):
                                  KButton(
                                      btnText: "Save",
                                      onTap: ()async {
                                       await profileController.updateProfile(
                                         imageUrl:imagePath.value,
                                         name:nameController.text,
                                         about:aboutController.text,
                                         number:phoneController.text,
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

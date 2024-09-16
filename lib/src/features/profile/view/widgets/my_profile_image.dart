import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_demo/src/features/profile/controller/image_picker_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileImage extends StatelessWidget {
 final RxString imagePath;
 final RxBool isEdit;
  const MyProfileImage({super.key, required this.imagePath, required this.isEdit,});

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController =
        Get.find<ImagePickerController>();
    ProfileController profileController = Get.find<ProfileController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => isEdit.value
              ? InkWell(
                  onTap: () async {
                    imagePath.value = await imagePickerController.pickedImage(
                      ImageSource.gallery,
                    );
                  },
                  child: imagePath.value != ""
                      ? Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
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
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          child: const Icon(Icons.add),
                        ),
                )
              : profileController.currentUserList.value.profilePic == null ||
                      profileController.currentUserList.value.profilePic == ""
                  ? CircleAvatar(
                      radius: 80,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: const Icon(
                        Icons.image,
                        size: 60,
                      ))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: profileController
                            .currentUserList.value.profilePic
                            .toString(),
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
        ),
      ],
    );
  }
}

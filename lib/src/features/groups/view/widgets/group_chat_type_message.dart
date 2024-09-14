import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/core/utils/colors.dart';
import 'package:chat_app_demo/src/features/chat/controller/chat_controller.dart';
import 'package:chat_app_demo/src/features/chat/view/widgets/image_picker_bottom_sheet.dart';
import 'package:chat_app_demo/src/features/groups/model/group_model.dart';
import 'package:chat_app_demo/src/features/profile/controller/image_picker_controller.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GroupChatTypeMessage extends StatelessWidget {
  final GroupModel groupModel;
  const GroupChatTypeMessage({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.find<ChatController>();
    TextEditingController messageController = TextEditingController();
    RxString message = "".obs;
    ImagePickerController imagePickerController =
    Get.find<ImagePickerController>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.emoji_emotions_outlined,
            size: 30,
            color: kPrimaryColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (val) {
                message.value = val;
              },
              controller: messageController,
              decoration: const InputDecoration(
                  filled: false, hintText: "Type message ...."),
            ),
          ),
          const SizedBox(width: 10),
          Obx(() => chatController.selectedImagePath.value == ""
              ? Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                imagePickerBottomSheet(
                  context: context,
                  chatController: chatController,
                  imagePickerController: imagePickerController,
                );
              },
              child: Icon(
                Icons.image_outlined,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 28,
              ),
            ),
          )
              : const SizedBox()),
          const SizedBox(width: 10),
          Obx(() => message.value != "" ||
              chatController.selectedImagePath.value != ""
              ? InkWell(
            onTap: () {
              // if (messageController.text.isNotEmpty ||
              //     chatController.selectedImagePath.value.isNotEmpty) {
              //   chatController.sendMessage(
              //       userModel.id!, messageController.text, userModel);
              //   messageController.clear();
              //   message.value = "";
              // }
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: chatController.isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : Icon(
                Icons.send,
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer,
                size: 28,
              ),
            ),
          )
              : Icon(
            Icons.mic,
            size: 30,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          )),
        ],
      ),
    );
  }
}

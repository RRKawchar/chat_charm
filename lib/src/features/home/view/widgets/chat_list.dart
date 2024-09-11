import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/chat/view/page/chat_page.dart';
import 'package:chat_app_demo/src/features/contact/controller/contact_controller.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.find<ContactController>();
    ProfileController profileController = Get.find<ProfileController>();
    return RefreshIndicator(
        child: Obx(
          () => ListView(
              children: contactController.chatRoomList
                  .map(
                    (element) => InkWell(
                      onTap: () {

                        Get.to(
                          ChatPage(
                            userModel: (element.receiver!.id ==
                                profileController.currentUserList.value.id
                                ? element.sender
                                : element.receiver)!,
                          ),
                        );
                      },
                      child: ChatTileWidget(
                          imageUrl: (element.receiver!.id ==
                              profileController.currentUserList.value.id
                              ? element.sender!.profilePic
                              : element.receiver!.profilePic) ??
                              AppConstants.defaultProfilePic,
                          name: (element.receiver!.id ==
                              profileController.currentUserList.value.id
                              ? element.sender!.name
                              : element.receiver!.name)!,
                          lastChat: element.lastMessage ?? "Last Message",
                          lastTime:element.lastMessageTimeStamp ?? "Last Time"),
                    ),
                  )
                  .toList()),
        ),
        onRefresh: () {
          return contactController.getChatRoomList();
        },);
  }
}

import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/groups/controller/group_controller.dart';
import 'package:chat_app_demo/src/features/groups/view/pages/group_chat_page.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeGroupPage extends StatelessWidget {
  const HomeGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.find<GroupController>();
    return Obx(
      () => groupController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: groupController.groupList
                  .map(
                    (groups) => InkWell(
                      onTap: () {
                        Get.to(GroupChatPage(groupModel: groups));
                      },
                      child: ChatTileWidget(
                        imageUrl: groups.profileUrl == ""
                            ? AppConstants.defaultProfilePic
                            : groups.profileUrl!,
                        name: groups.name ?? "Unknown group",
                        lastChat: "Group created",
                        lastTime: "Just Now",
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

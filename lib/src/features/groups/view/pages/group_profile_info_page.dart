import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/groups/model/group_model.dart';
import 'package:chat_app_demo/src/features/groups/view/widgets/group_profile_info_top_widget.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:chat_app_demo/src/features/profile/view/widgets/user_profile_info.dart';
import 'package:flutter/material.dart';

class GroupProfileInfo extends StatelessWidget {
  final GroupModel groupModel;
  const GroupProfileInfo({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupModel.name ?? ""),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            GroupProfileInfoTopWidget(
              profileImage:
                  groupModel.profileUrl == "" || groupModel.profileUrl == null
                      ? AppConstants.defaultProfilePic
                      : groupModel.profileUrl!,
              userName: groupModel.name ?? "",
              userEmail: groupModel.description ?? "No Description Available",
              groupId: groupModel.id!,
            ),
            const SizedBox(height: 20),
            Text(
              "Members",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
            Column(
                children: groupModel.members!
                    .map(
                      (e) => ChatTileWidget(
                        imageUrl: e.profilePic == "" || e.profilePic == null
                            ? AppConstants.defaultProfilePic
                            : e.profilePic!,
                        name: e.name ?? "Unknown",
                        lastChat: e.email ?? "email",
                        lastTime: e.role == "admin" ? "Admin" : "",
                      ),
                    )
                    .toList())
          ],
        ),
      ),
    );
  }
}

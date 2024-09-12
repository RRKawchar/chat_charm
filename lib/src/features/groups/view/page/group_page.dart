import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTileWidget(
            imageUrl: AppConstants.defaultProfilePic,
            name: "Spoken English Group",
            lastChat: "Hello! How are you?",
            lastTime: "11:20 am",
        )
      ],
    );
  }
}

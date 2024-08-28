import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       InkWell(
         onTap: (){
           // Get.toNamed(AppRoutes.chatPage);
         },
         child:  ChatTileWidget(
           imageUrl: AppConstants.defaultProfilePic.toString(),
           name: "khsjkkjdjj",
           lastChat: "How are you",
           lastTime: "09:55 PM",
         ),
       ),
         ChatTileWidget(
          imageUrl:AppConstants.defaultProfilePic.toString(),
          name: "RRK",
          lastChat: "I am fine . and u?",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "KAS",
          lastChat: "How are you",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "khsjkkjdjj",
          lastChat: "Where are u from?",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "khsjkkjdjj",
          lastChat: "How are you",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "RRK",
          lastChat: "I am fine . and u?",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "KAS",
          lastChat: "How are you",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "khsjkkjdjj",
          lastChat: "Where are u from?",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "khsjkkjdjj",
          lastChat: "How are you",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "RRK",
          lastChat: "I am fine . and u?",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "KAS",
          lastChat: "How are you",
          lastTime: "09:55 PM",
        ),
         ChatTileWidget(
          imageUrl: AppConstants.defaultProfilePic.toString(),
          name: "khsjkkjdjj",
          lastChat: "Where are u from?",
          lastTime: "09:55 PM",
        ),
      ],
    );
  }
}

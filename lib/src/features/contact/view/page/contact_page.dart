import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/chat/controller/chat_controller.dart';
import 'package:chat_app_demo/src/features/chat/view/page/chat_page.dart';
import 'package:chat_app_demo/src/features/contact/controller/contact_controller.dart';
import 'package:chat_app_demo/src/features/contact/view/widgets/contact_search.dart';
import 'package:chat_app_demo/src/features/contact/view/widgets/new_contact_list_tile.dart';
import 'package:chat_app_demo/src/features/groups/view/page/new_group_page.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController=Get.find<ContactController>();
    ChatController chatController=Get.find<ChatController>();
    ProfileController profileController=Get.find<ProfileController>();
    RxBool isSearchEnable=false.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contact"),
        actions: [
          Obx(() =>
              IconButton(
                  onPressed: (){
                    isSearchEnable.value=!isSearchEnable.value;
                  },
                  icon: Icon(
                      isSearchEnable.value?
                      Icons.close:
                      Icons.search,
                  ),
              )
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Obx(() =>
            isSearchEnable.value?
            const ContactSearch():
            Container(),
            ),
            const SizedBox(height: 10),
            NewContactListTile(
              btnText: "New Contact",
              icon: Icons.person_add,
              onTap: (){

              },
            ),
            const SizedBox(height: 10),
            NewContactListTile(
              btnText: "New Group",
              icon: Icons.group_add,
              onTap: (){
                Get.to(NewGroup());
              },
            ),
            const SizedBox(height: 10),
            NewContactListTile(
              btnText: "New community",
              icon: Icons.groups_outlined,
              onTap: (){

              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Contact on ChatCharm",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
             Obx(() =>  Column(
             children:
             contactController.userList.map((element) =>
                 InkWell(
                   onTap: (){
                   Get.to(ChatPage(userModel: element));

                 String roomId=chatController.getRoomId(element.id!);
                 kPrint("Checking roomId : $roomId");
                   },
                   child:  ChatTileWidget(
                     imageUrl:element.profilePic==null|| element.profilePic==""?
                     AppConstants.defaultProfilePic.toString():element.profilePic.toString(),
                     name: element.name??"User Name",
                     lastChat: element.about??"",
                     lastTime: element.email==profileController.currentUserList.value.email?"You":"",
                   ),
                 ),
             ).toList(),
           ),
           )

          ],
        ),
      ),
    );
  }
}

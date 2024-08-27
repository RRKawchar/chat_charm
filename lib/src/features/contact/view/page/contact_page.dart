import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/core/utils/assets_image.dart';
import 'package:chat_app_demo/src/features/contact/view/widgets/contact_search.dart';
import 'package:chat_app_demo/src/features/contact/view/widgets/new_contact_list_tile.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            ContactSearch():
            Container(),
            ),
            SizedBox(height: 10),
            NewContactListTile(
              btnText: "New Contact",
              icon: Icons.person_add,
              onTap: (){

              },
            ),
            SizedBox(height: 10),
            NewContactListTile(
              btnText: "New Group",
              icon: Icons.group_add,
              onTap: (){

              },
            ),
            SizedBox(height: 10),
            NewContactListTile(
              btnText: "New community",
              icon: Icons.groups_outlined,
              onTap: (){

              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Contact on ChatCharm",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.chatPage);
              },
              child: const ChatTileWidget(
                imageUrl: AssetsImage.girlAvatarImage,
                name: "khsjkkjdjj",
                lastChat: "How are you",
                lastTime: "09:55 PM",
              ),
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.boyAvatarImage,
              name: "RRK",
              lastChat: "I am fine . and u?",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.girlAvatarImage,
              name: "KAS",
              lastChat: "How are you",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.boyAvatarImage,
              name: "khsjkkjdjj",
              lastChat: "Where are u from?",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.girlAvatarImage,
              name: "khsjkkjdjj",
              lastChat: "How are you",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.boyAvatarImage,
              name: "RRK",
              lastChat: "I am fine . and u?",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.girlAvatarImage,
              name: "KAS",
              lastChat: "How are you",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.boyAvatarImage,
              name: "khsjkkjdjj",
              lastChat: "Where are u from?",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.girlAvatarImage,
              name: "khsjkkjdjj",
              lastChat: "How are you",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.boyAvatarImage,
              name: "RRK",
              lastChat: "I am fine . and u?",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.girlAvatarImage,
              name: "KAS",
              lastChat: "How are you",
              lastTime: "09:55 PM",
            ),
            const ChatTileWidget(
              imageUrl: AssetsImage.boyAvatarImage,
              name: "khsjkkjdjj",
              lastChat: "Where are u from?",
              lastTime: "09:55 PM",
            ),
          ],
        ),
      ),
    );
  }
}

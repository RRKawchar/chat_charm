import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/core/utils/assets_image.dart';
import 'package:chat_app_demo/src/core/utils/colors.dart';
import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/chat/controller/chat_controller.dart';
import 'package:chat_app_demo/src/features/contact/controller/contact_controller.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_list.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/home_tapbar.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/view/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController=Get.find<ProfileController>();
    ContactController contactController=Get.find<ContactController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsImage.messageIcon,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              contactController.getChatRoomList();
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.profilePage);
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
        bottom: homeTabBar(
          context: context,
          tabController: tabController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Get.toNamed(AppRoutes.contactPage);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: tabController,
          children: [
            const ChatList(),
            ListView(
              children: const [
                ListTile(
                  title: Text("Name dd"),
                )
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("Name tt"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

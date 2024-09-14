import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/contact/controller/contact_controller.dart';
import 'package:chat_app_demo/src/features/groups/controller/group_controller.dart';
import 'package:chat_app_demo/src/features/groups/view/page/group_create_page.dart';
import 'package:chat_app_demo/src/features/groups/view/widgets/select_members_list.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {

    ContactController contactController = Get.find<ContactController>();
    GroupController groupController =Get.find<GroupController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Group"),
      ),
      floatingActionButton: Obx(() => FloatingActionButton(
        backgroundColor: groupController.groupMembers.isEmpty?
        Colors.grey:
        Theme.of(context).colorScheme.primary,
        onPressed: (){
          if(groupController.groupMembers.isEmpty){
            Get.snackbar("Error", "Please add at least one members",backgroundColor: Colors.amber);
          }else{
            Get.to(GroupCreatePage());
          }
        },
        child: Icon(Icons.arrow_forward,color: Theme.of(context).colorScheme.onBackground,),
      ),),
      body: Padding(

        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
           const SelectMembersList(),
            const SizedBox(height: 10),
            Row(children: [
              Text("Contact on Chat Charm",style: Theme.of(context).textTheme.labelMedium,)
            ],),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<UserModel>>(
                stream: contactController.getContact(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error ${snapshot.error}"),
                    );
                  }
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text("No Message"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: (){
                            groupController.selectMembers(snapshot.data![index]);
                          },
                          child: ChatTileWidget(
                            imageUrl: snapshot.data![index].profilePic ??
                                AppConstants.defaultProfilePic,
                            name: snapshot.data![index].name ?? "",
                            lastChat: snapshot.data![index].about ?? "",
                            lastTime: "",
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

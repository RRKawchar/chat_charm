import 'package:chat_app_demo/src/features/chat/controller/chat_controller.dart';
import 'package:chat_app_demo/src/features/chat/model/chat_model.dart';
import 'package:chat_app_demo/src/features/chat/view/widgets/chat_bubble.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:chat_app_demo/src/features/profile/view/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.find<ChatController>();
    TextEditingController messageController = TextEditingController();
    ProfileController profileController = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ],
        ),

        title: InkWell(
          onTap: () {
            Get.to(UserProfilePage(userModel: userModel,));
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  userModel.profilePic.toString(),
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Offline",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
        ],

        // Padding(
        //   padding: const EdgeInsets.all(4),
        //   child: ClipRRect(
        //       borderRadius: BorderRadius.circular(100),
        //
        //       child: Image.asset(AssetsImage.boyAvatarImage,)),
        // ),
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(bottom: 70, left: 10, right: 10, top: 10),
          child: StreamBuilder<List<ChatModel>>(
            stream: chatController.getMessages(userModel.id!),
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
                    reverse: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      DateTime timeStamp =
                          DateTime.parse(snapshot.data![index].timestamp);
                      String formattedDateTime =
                          DateFormat("hh:mm a").format(timeStamp);
                      return ChatBubble(
                        message: snapshot.data![index].message,
                        imageUrl: snapshot.data![index].imageUrl ?? "",
                        isComing: snapshot.data![index].receiverId ==
                            profileController.currentUserList.value.id,
                        status: "read",
                        time: formattedDateTime,
                      );
                    });
              }
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(children: [
          Icon(
            Icons.mic,
            size: 25,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                  filled: false, hintText: "Type message ...."),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.image_outlined,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 28,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              if (messageController.text.isNotEmpty) {
                chatController.sendMessage(
                    userModel.id!, messageController.text, userModel);
                messageController.clear();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.send,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 28,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/call/controller/call_controller.dart';
import 'package:chat_app_demo/src/features/call/view/page/audio_call_page.dart';
import 'package:chat_app_demo/src/features/call/view/page/video_call_page.dart';
import 'package:chat_app_demo/src/features/chat/controller/chat_controller.dart';
import 'package:chat_app_demo/src/features/chat/model/chat_model.dart';
import 'package:chat_app_demo/src/features/chat/view/widgets/chat_bubble.dart';
import 'package:chat_app_demo/src/features/chat/view/widgets/chat_type_message.dart';
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
    ProfileController profileController = Get.find<ProfileController>();
    CallController callController = Get.find<CallController>();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(
              UserProfilePage(
                userModel: userModel,
              ),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl:
                      userModel.profilePic ?? AppConstants.defaultProfilePic,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.name.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    StreamBuilder(
                      stream: chatController.getStatus(userModel.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text(".......");
                        } else {
                          return Text(
                            snapshot.data!.status ?? "",
                            style: TextStyle(
                              fontSize: 12,
                              color: snapshot.data!.status == "Online"
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                AudioCallPage(
                  targetUser: userModel,
                ),
              );
              callController.callAction(
                receiver: userModel,
                caller: profileController.currentUserList.value,
                type: "audio",
              );
            },
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                VideoCallPage(
                  targetUser: userModel,
                ),
              );
              callController.callAction(
                receiver: userModel,
                caller: profileController.currentUserList.value,
                type: "video",
              );
            },
            icon: const Icon(Icons.video_call),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  StreamBuilder<List<ChatModel>>(
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
                          },
                        );
                      }
                    },
                  ),
                  Obx(
                    () => chatController.selectedImagePath.value != ""
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(
                                          File(chatController
                                              .selectedImagePath.value),
                                        ),
                                        fit: BoxFit.contain),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  height: 500,
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      chatController.selectedImagePath.value =
                                          "";
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            ChatTypeMessage(
              userModel: userModel,
            )
          ],
        ),
      ),
    );
  }
}

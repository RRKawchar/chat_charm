import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/call/controller/call_controller.dart';
import 'package:chat_app_demo/src/features/home/view/widgets/chat_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallHistoryPage extends StatelessWidget {
  const CallHistoryPage({super.key,});

  @override
  Widget build(BuildContext context) {
    CallController callController = Get.find<CallController>();
    return StreamBuilder(
      stream: callController.getCalls(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                },
                child: ChatTileWidget(
                  imageUrl: snapshot.data![index].callerPic ??
                      AppConstants.defaultProfilePic,
                  name: snapshot.data![index].callerName ?? "Unknown",
                  lastChat: snapshot.data![index].type ?? "",
                  lastTime: snapshot.data![index].time ?? "",
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

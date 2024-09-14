import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:chat_app_demo/src/features/groups/controller/group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectMembersList extends StatelessWidget {
  const SelectMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.find<GroupController>();
    return Obx(() => Row(
      children: groupController.groupMembers.map((e) =>
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:CachedNetworkImage(
                    imageUrl:e.profilePic?? AppConstants.defaultProfilePic,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 2,
                child: InkWell(
                  onTap: (){
                    groupController.groupMembers.remove(e);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.close,color: Colors.black,size: 15,),
                  ),
                ),
              )
            ],
          )
      ).toList(),
    ),);
  }
}

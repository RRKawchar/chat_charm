import 'package:chat_app_demo/src/core/utils/assets_image.dart';
import 'package:chat_app_demo/src/core/utils/colors.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  const UserProfileInfo({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
   final  ProfileController profileController = Get.find<ProfileController>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    profileImage,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  userName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  userEmail,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            color: kGreenColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Call",
                            style: TextStyle(
                              color: kGreenColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.video_call,
                            color: kVideoCallColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Video",
                            style: TextStyle(
                              color: kVideoCallColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.message,
                            color: kMessageColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "message",
                            style: TextStyle(
                              color: kMessageColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

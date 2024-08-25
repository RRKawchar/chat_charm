import 'package:chat_app_demo/src/core/utils/assets_image.dart';
import 'package:chat_app_demo/src/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPageHeading extends StatelessWidget {
  const AuthPageHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsImage.messageIcon,
              width: 120,
              height: 120,
              color:kPrimaryColor,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Chat ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        )
      ],
    );
  }
}

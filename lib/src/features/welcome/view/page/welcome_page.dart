
import 'package:chat_app_demo/src/core/extensions/build_context_extensions.dart';
import 'package:chat_app_demo/src/features/welcome/view/widgets/welcom_heading.dart';
import 'package:chat_app_demo/src/features/welcome/view/widgets/welcome_body.dart';
import 'package:chat_app_demo/src/features/welcome/view/widgets/welcome_footer_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 20),
              const WelcomeHeading(),
              SizedBox(height: context.screenHeight/6),
              const WelcomeBody(),
              const SizedBox(height: 50),
              const WelcomeFooterButton()

            ],
          ),
        ),
      ),
    );
  }
}

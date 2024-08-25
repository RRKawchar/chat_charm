import 'package:chat_app_demo/src/features/auth/view/widgets/auth_page_body.dart';
import 'package:chat_app_demo/src/features/auth/view/widgets/auth_page_heading.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthPageHeading(),
                  SizedBox(height: 20),
                  AuthPageBody()
                ],
              ),
            ),
          ),
        ),
    );
  }
}

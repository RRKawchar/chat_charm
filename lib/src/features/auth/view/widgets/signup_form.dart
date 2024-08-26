import 'package:chat_app_demo/src/core/widgets/k_button.dart';
import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

    AuthController authController=Get.find<AuthController>();

    return  Column(
      children: [
        const SizedBox(height: 40),
         TextField(
           controller: nameController,
          decoration: const InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 40),
         TextField(
           controller: emailController,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        const SizedBox(height: 40),
         TextField(
           controller: passwordController,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        const SizedBox(height: 20),
        const Text("Already have an account? LOGIN!"),
        const SizedBox(height: 40),
        Obx(() =>
        authController.isLoading.value?
        const Center(child: CircularProgressIndicator(),):
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KButton(
              btnText: "SIGNUP",
              onTap: (){
                authController.createUser(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text
                );
              },
            ),
          ],
        ),
        )
      ],
    );
  }
}

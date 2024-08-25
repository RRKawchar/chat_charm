import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/core/widgets/k_button.dart';
import 'package:chat_app_demo/src/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    AuthController authController=Get.put(AuthController());
    return Column(
      children: [
        const SizedBox(height: 30),
         TextField(
           controller: emailController,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        const SizedBox(height: 30),
         TextField(
           controller: passwordController,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
             onTap:(){
              kPrint("I am checking Forget password");
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Forget Password",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text("Don't have an account? SignUp!"),
        const SizedBox(height: 40),
        Obx(() => authController.isLoading.value?
        const Center(child: CircularProgressIndicator(),):
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KButton(
              btnText: "LOGIN",
              onTap: (){
                authController.login(email: emailController.text, password: passwordController.text);
                //Get.offAllNamed(AppRoutes.homePage);
              },
            ),
          ],
        ),),
      ],
    );
  }
}

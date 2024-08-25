import 'package:chat_app_demo/src/core/extensions/build_context_extensions.dart';
import 'package:chat_app_demo/src/features/auth/view/widgets/login_form.dart';
import 'package:chat_app_demo/src/features/auth/view/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = true.obs;
    return Container(
      padding: const EdgeInsets.all(20),
      // height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: isLogin.value
                                  ? Theme.of(context).textTheme.bodyLarge
                                  : Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(height: 5),
                            AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              width: isLogin.value ? 100 : 0,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: Column(
                          children: [
                            Text(
                              "SignUp",
                              style: isLogin.value
                                  ? Theme.of(context).textTheme.labelLarge
                                  : Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 5),
                            AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              width: isLogin.value ? 0 : 100,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => isLogin.value ?
                  const LoginForm() :
                  const SignUpForm(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

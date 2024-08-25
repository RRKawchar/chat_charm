import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  SlideAction(
      onSubmit: (){
       Get.offAllNamed(AppRoutes.authPage);
      },
      text: AppConstants.getStarted,
      textStyle: Theme.of(context).textTheme.labelLarge,
      sliderButtonIcon: Icon(Icons.arrow_circle_right_outlined,color: Theme.of(context).colorScheme.primary,size: 25,),
      sliderRotate: false,
      outerColor: Theme.of(context).colorScheme.primaryContainer,

    );
  }
}

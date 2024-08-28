import 'package:chat_app_demo/src/features/auth/view/page/auth_page.dart';
import 'package:chat_app_demo/src/features/chat/view/page/chat_page.dart';
import 'package:chat_app_demo/src/features/contact/view/page/contact_page.dart';
import 'package:chat_app_demo/src/features/home/view/page/home_page.dart';
import 'package:chat_app_demo/src/features/profile/view/pages/profile_page.dart';
import 'package:chat_app_demo/src/features/profile/view/pages/update_profile_page.dart';
import 'package:chat_app_demo/src/features/splash/view/page/splash_page.dart';
import 'package:chat_app_demo/src/features/welcome/view/page/welcome_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashPage = "/";
  static const String welcomePage = "/welcome-page";
  static const String authPage = "/auth-page";
  static const String homePage = "/home-page";
 // static const String chatPage = "/chat-page";
  static const String profilePage="/profile-page";
  static const String contactPage="/contact-page";

 static List<GetPage> pageList = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => const SplashPage(),
    ),
   GetPage(
     name: AppRoutes.welcomePage,
     page: () => const WelcomePage(),
   ),
   GetPage(
     name: AppRoutes.authPage,
     page: () => const AuthPage(),
     transition:Transition.rightToLeft
   ),
   GetPage(
       name: AppRoutes.homePage,
       page: () => const HomePage(),
       transition:Transition.rightToLeft
   ),
   // GetPage(
   //     name: AppRoutes.chatPage,
   //     page: () => const ChatPage(),
   //     transition:Transition.rightToLeft
   // ),
   GetPage(
       name: AppRoutes.profilePage,
       page: () => const ProfilePage(),
       transition:Transition.rightToLeft
   ),
   GetPage(
       name: AppRoutes.contactPage,
       page: () => const ContactPage(),
       transition:Transition.rightToLeft
   ),
  ];
}

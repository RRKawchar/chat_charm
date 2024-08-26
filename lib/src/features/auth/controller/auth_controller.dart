import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final fireStoreDB = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Future<void> createUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser( name: name,email: email,);
      kPrint("User Created");
      Get.offAllNamed(AppRoutes.homePage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        kPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        kPrint('The account already exists for that email.');
      }
    } catch (e) {
      kPrint(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      Get.offAllNamed(AppRoutes.homePage);
      kPrint("Login successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        kPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        kPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      kPrint(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logoutUser() async {
    await auth.signOut();
    Get.offAllNamed(AppRoutes.authPage);
  }

  Future<void> initUser({required String name,required String email,}) async {
    UserModel newUser = UserModel(
      id: auth.currentUser!.uid,
      email: email,
      name: name,
    );

    await fireStoreDB.collection("users").doc(auth.currentUser!.uid).set(
          newUser.toJson(),
        );
  }
}

import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  final auth=FirebaseAuth.instance;

  RxBool isLoading=false.obs;

  Future<void> createUser({required String email,required String password})async{

    try {

      isLoading.value=true;
        await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
        kPrint("User Created");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        kPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        kPrint('The account already exists for that email.');
      }
    } catch (e) {
      kPrint(e);
    }finally{
      isLoading.value=false;
    }
  }



  Future<void> login({required String email,required String password})async{
    try {
      isLoading.value=true;
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      Get.offAllNamed(AppRoutes.homePage);
      kPrint("Login successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        kPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        kPrint('Wrong password provided for that user.');
      }
    }catch(e){
      kPrint(e);
    }finally{
      isLoading.value=false;
    }
  }

}
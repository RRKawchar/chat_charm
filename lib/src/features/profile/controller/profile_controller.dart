import 'dart:io';

import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  final auth=FirebaseAuth.instance;
  final fireStoreDB=FirebaseFirestore.instance;
  final storage=FirebaseStorage.instanceFor(bucket: "gs://berber-booking-app.appspot.com");
  Rx<UserModel> userInfoList=UserModel().obs;
  RxBool isLoading=false.obs;


  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  Future<void> getUserInfo()async{
    try{
      await fireStoreDB.collection("users").doc(auth.currentUser!.uid).get().then((value){
         userInfoList.value=UserModel.fromJson(value.data()!);
      });
    }catch(e){
      kPrint(e);
    }finally{
    }
  }

  Future<void> updateProfile({
    required String imageUrl,
    required String name,
    required String about,
    required String number,
  }) async {
    isLoading.value = true;
    try {

      String? imageLink = userInfoList.value.profilePic;
      if (imageUrl.isNotEmpty) {
        imageLink = await uploadImage(imagePath: imageUrl);
      }

      final updatedUser = UserModel(
        id: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        name: name,
        about: about,
        profilePic: imageLink,
        phoneNumber: number,
      );

      await fireStoreDB.collection("users").doc(auth.currentUser!.uid).set(
        updatedUser.toJson(),
      );
       await getUserInfo();

    } catch (ex) {
      kPrint("Error updating profile: $ex");
    } finally {
      isLoading.value = false;
    }
  }


  Future<String> uploadImage({required String imagePath}) async {
    try {
      final path = "files/${imagePath.split('/').last}";
      final file = File(imagePath);

      final ref = storage.ref().child(path).putFile(file);
      final uploadTask = await ref.whenComplete(() {});
      final downloadImageUrl = await uploadTask.ref.getDownloadURL();

      kPrint(downloadImageUrl);
      return downloadImageUrl;
    } catch (ex) {
      kPrint("Error uploading file: $ex");
      return "";
    }
  }







}
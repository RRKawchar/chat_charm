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
  final storage=FirebaseStorage.instance;

  Rx<UserModel> userInfoList=UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  Future<void> getUserInfo()async{
    kPrint("I am checking User List: ${userInfoList.value}");
    try{
      await fireStoreDB.collection("users").doc(auth.currentUser!.uid).get().then((value){
         userInfoList.value=UserModel.fromJson(value.data()!);
      });
      kPrint("I am checking User List3: ${userInfoList.value.email}");
    }catch(e){
      kPrint(e);
    }
  }

  Future<void> updateUserInfo({
    required String imageUrl,
    required String name,
    required String about,
    required String phone,
  })async{


  }


  Future<String> uploadFileToFirebase({required String imagePath})async{
    final path="files/$imagePath";
    final file=File(imagePath);
    if(imagePath != ""){
      try{
       final ref= storage.ref().child(path).putFile(file);
       final uploadTask=await ref.whenComplete((){});
       final downloadImageUrl=await uploadTask.ref.getDownloadURL();
       kPrint("Image downloadUrl $downloadImageUrl");

       return downloadImageUrl;
      }catch(e){
        kPrint(e);
        return e.toString();
      }
      
    }
    return "";
    
  } 






}
import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{
  final auth=FirebaseAuth.instance;
  final fireStore=FirebaseFirestore.instance;

  RxBool isLoading=false.obs;
  var userList=<UserModel>[].obs;


  @override
  void onInit()async {
    super.onInit();
    getContactUser();
  }


  Future<void> getContactUser()async{
    try{
    isLoading.value=true;
      await fireStore.collection("users").get().then((value) => {
        userList.value=value.docs.map((e) => UserModel.fromJson(e.data())).toList(),
      });

    }catch(e){
      kPrint(e);
    }finally{
      isLoading.value=false;
    }
  }

}
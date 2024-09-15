import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StatusController extends GetxController with WidgetsBindingObserver{

  final auth=FirebaseAuth.instance;
  final fireStoreDB=FirebaseFirestore.instance;


  @override
  void onInit() async{
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    await fireStoreDB.collection('users').doc(auth.currentUser!.uid).update({
      "status":"Online",
    });
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state)async {
    //kPrint("AppLifeCycleState $state");
    if(state==AppLifecycleState.inactive){
      kPrint("Offline");
        await fireStoreDB.collection('users').doc(auth.currentUser!.uid).update({
           "status":"Offline",
        });
    } else if(state == AppLifecycleState.resumed){
      kPrint("Online");
      await fireStoreDB.collection('users').doc(auth.currentUser!.uid).update({
        "status":"Online",
      });
    }


    super.didChangeAppLifecycleState(state);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }


}




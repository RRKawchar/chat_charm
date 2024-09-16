import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/features/call/model/call_model.dart';
import 'package:chat_app_demo/src/features/call/view/page/audio_call_page.dart';
import 'package:chat_app_demo/src/features/call/view/page/video_call_page.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final auth = FirebaseAuth.instance;
  final fireStoreDB = FirebaseFirestore.instance;
  final uuid = const Uuid().v4();

  @override
  void onInit() {
    super.onInit();

       if(auth.currentUser !=null){
         getCallsNotification().listen((List<CallModel> callList) {
           if (callList.isNotEmpty) {
             var callData = callList[0];
             if(callData.type=="audio"){
               audioCallNotifications(callData);
             }else if(callData.type=='video'){
               videoCallNotifications(callData);
             }

           }
         });
       }

  }

  Future<void> audioCallNotifications(CallModel callData)async{
    Get.snackbar(
      duration: const Duration(days: 1),
      barBlur: 0,
      isDismissible: false,
      backgroundColor: Colors.blueGrey,
      onTap: (snack) {
        Get.back();
        Get.to(
          AudioCallPage(
            targetUser: UserModel(
                id: callData.callerUid,
                name: callData.callerName,
                email: callData.callerEmail,
                profilePic: callData.callerPic),
          ),
        );
      },
      callData.callerName!,
      "Incoming audio Call",
      mainButton: TextButton(
          onPressed: () {
            endCall(callData);
            Get.back();
          },
          child: const Text("End Call")),
    );
  }

  void videoCallNotifications(CallModel callData) {
    Get.snackbar(
      duration: const Duration(days: 1),
      barBlur: 0,
      isDismissible: false,
      backgroundColor: Colors.blueGrey,
      onTap: (snack) {
        Get.back();
        Get.to(
          VideoCallPage(
            targetUser: UserModel(
                id: callData.callerUid,
                name: callData.callerName,
                email: callData.callerEmail,
                profilePic: callData.callerPic,),
          ),
        );
      },
      callData.callerName!,
      "Incoming video Call",
      mainButton: TextButton(
          onPressed: () {
            endCall(callData);
            Get.back();
          },
          child: const Text("End Call")),
    );
  }

  Future<void> callAction(
      {required UserModel receiver, required UserModel caller,required String type}) async {
    String id = uuid;
    DateTime timeStamp =DateTime.now();
    String formattedDateTime =DateFormat("hh:mm a").format(timeStamp);
    var newCall = CallModel(
        id: id,
        callerName: caller.name,
        callerPic: caller.profilePic,
        callerUid: caller.id,
        callerEmail: caller.email,
        receiverName: receiver.name,
        receiverPic: receiver.profilePic,
        receiverEmail: receiver.email,
        receiverUid: receiver.id,
        status: "dialing",
        type: type,
        time: formattedDateTime,
        timestamp: FieldValue.serverTimestamp().toString()

    );
    try {
      await fireStoreDB
          .collection("notification")
          .doc(receiver.id)
          .collection("call")
          .doc(id)
          .set(
            newCall.toJson(),
          );
      await fireStoreDB
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("calls")
          .doc(id)
          .set(
            newCall.toJson(),
          );
      await fireStoreDB
          .collection("users")
          .doc(receiver.id)
          .collection("calls")
          .doc(id)
          .set(
            newCall.toJson(),
          );

      Future.delayed(const Duration(seconds: 20), () {
        endCall(newCall);
      });
    } catch (e) {
      kPrint("Error while calling :$e");
      throw "Error while calling :$e";
    }
  }

  Stream<List<CallModel>> getCallsNotification() {
     try{
       return fireStoreDB
           .collection('notification')
           .doc(auth.currentUser!.uid)
           .collection("call")
           .snapshots()
           .map((snapshot) => snapshot.docs
           .map((doc) => CallModel.fromJson(doc.data()))
           .toList());
     }catch(e){
       kPrint("Error while get call notification $e");
       throw "Error while get call notification $e";
     }
    }




  Future<void> endCall(CallModel call) async {
    try {
      await fireStoreDB
          .collection("notification")
          .doc(call.receiverUid)
          .collection('call')
          .doc(call.id)
          .delete();
    } catch (e) {
      kPrint("Error while call ending $e");
      throw "Error while call ending $e";
    }
  }


  Stream<List<CallModel>> getCalls(){
    return fireStoreDB.collection("users").doc(auth.currentUser!.uid)
        .collection("calls")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
         .map((doc) => CallModel.fromJson(doc.data())).toList()
    );
  }




}




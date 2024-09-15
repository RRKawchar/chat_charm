import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/features/call/model/audio_call_model.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final auth = FirebaseAuth.instance;
  final fireStoreDB = FirebaseFirestore.instance;
  final uuid = const Uuid().v4();


  @override
  void onInit() {
    super.onInit();

    getCallsNotifications().listen((snapshot) {
      if(snapshot.docs.isNotEmpty){
        Get.snackbar("Calling", "Calling");
      }
    });
  }

  Future<void> callAction(
      {required UserModel receiver, required UserModel caller}) async {
    String id = uuid;
    var newCall = AudioCallModel(
        id: id,
        callerName: caller.name,
        callerPic: caller.profilePic,
        callerUid: caller.id,
        callerEmail: caller.email,
        receiverName: receiver.name,
        receiverPic: receiver.profilePic,
        receiverEmail: receiver.email,
        receiverUid: receiver.email,
        status: "dialing");
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

      Future.delayed(const Duration(seconds: 20),(){
        endCall(newCall);
      });
    } catch (e) {
      kPrint("Error while calling :$e");
      throw "Error while calling :$e";
    }
  }

  Stream<QuerySnapshot> getCallsNotifications() {
    return fireStoreDB
        .collection("notification")
        .doc(auth.currentUser!.uid)
        .collection('call')
        .snapshots();
  }



  Future<void> endCall(AudioCallModel call)async{
    try{

      await fireStoreDB
          .collection("notification")
          .doc(call.receiverUid)
          .collection('call').doc(call.id).delete();
    }catch(e){
      kPrint("Error while call ending $e");
      throw "Error while call ending $e";
    }
  }

}

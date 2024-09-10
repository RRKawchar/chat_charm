import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/features/chat/model/chat_model.dart';
import 'package:chat_app_demo/src/features/chat/model/chat_room_model.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController{
   ProfileController profileController=Get.find<ProfileController>();
  final fireStore=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  RxBool isLoading=false.obs;
  var uuid = const Uuid();


  String getRoomId(String targetUserId){

    String currentUserId=auth.currentUser!.uid;
    if(currentUserId[0].codeUnitAt(0)>targetUserId[0].codeUnitAt(0)){
      return  currentUserId+targetUserId;
    }
    return targetUserId+currentUserId;

  }


  Future<void> sendMessage(String targetUserId,String message,UserModel targetUser)async{

    String roomId=getRoomId(targetUserId);
    String chatId=uuid.v6();
    var newChat=ChatModel(
        id: chatId,
        message: message,
        senderName: profileController.currentUserList.value.name.toString(),
        senderId: auth.currentUser!.uid,
        receiverId:targetUserId,
        timestamp: DateTime.now().toString(),
        readStatus: "",
        imageUrl: "",
        videoUrl: "",
        audioUrl: "",
        documentUrl: "",
        reactions: [],
        replies: [],
    );

    var roomDetails=ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimeStamp: DateTime.now().toString(),
      sender: profileController.currentUserList.value,
      receiver:targetUser,
      messages: [],
      timestamp: DateTime.now().toString(),
      unReadMessageNo: 0,
    );

    try{

      isLoading.value=true;

      await fireStore.collection("chats").
      doc(roomId).set(
        roomDetails.toJson(),
      );

      await fireStore.collection("chats").
      doc(roomId).
      collection("messages").
      doc(chatId).
      set(newChat.toJson(),
      );

    }catch(e){
      kPrint(e.toString());
    }finally{
      isLoading.value=false;
    }

  }



  Stream<List<ChatModel>> getMessages(String targetUserId){
    String roomId=getRoomId(targetUserId);
    return fireStore.collection("chats").
    doc(roomId).collection("messages").
    orderBy("timestamp",descending: true).snapshots().
    map((snapshot) =>
        snapshot.docs.map((doc) =>
            ChatModel.fromJson(doc.data())).toList());
  }

}
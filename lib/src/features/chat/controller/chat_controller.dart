import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/features/chat/model/chat_model.dart';
import 'package:chat_app_demo/src/features/chat/model/chat_room_model.dart';
import 'package:chat_app_demo/src/features/contact/controller/contact_controller.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController{
   ProfileController profileController=Get.find<ProfileController>();
   ContactController contactController=Get.find<ContactController>();
  final fireStore=FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  RxBool isLoading=false.obs;
  var uuid = const Uuid();
  RxString selectedImagePath="".obs;


  String getRoomId(String targetUserId){
    String currentUserId=auth.currentUser!.uid;
    if(currentUserId[0].codeUnitAt(0)>targetUserId[0].codeUnitAt(0)){
      return  currentUserId+targetUserId;
    }
    return targetUserId+currentUserId;

  }


  UserModel getSender(UserModel currentUser, UserModel targetUser){
    String currentUserId=currentUser.id!;
    String targetUserId=targetUser.id!;
    if(currentUserId[0].codeUnitAt(0)> targetUserId[0].codeUnitAt(0)){
      return currentUser;
    }else{
      return targetUser;
    }
  }

  UserModel getReceiver(UserModel currentUser,UserModel targetUser){
    String currentUserId=currentUser.id!;
    String targetUserId=targetUser.id!;
    if(currentUserId[0].codeUnitAt(0)>targetUserId[0].codeUnitAt(0)){
      return targetUser;
    }else{
      return currentUser;
    }
  }



   Future<void> sendMessage(String targetUserId,String message,UserModel targetUser)async{
     try{
       isLoading.value=true;

       String roomId=getRoomId(targetUserId);
       String chatId=uuid.v6();
       DateTime timeStamp =DateTime.now();
       String formattedDateTime =DateFormat("hh:mm a").format(timeStamp);

       UserModel sender=getSender(profileController.currentUserList.value, targetUser);
       UserModel receiver=getReceiver(profileController.currentUserList.value, targetUser);
        RxString imageUrl="".obs;
         if(selectedImagePath.value.isNotEmpty){
           imageUrl.value=await profileController.uploadImage(imagePath: selectedImagePath.value);
         }

       var newChat=ChatModel(
         id: chatId,
         message: message,
         senderName: profileController.currentUserList.value.name.toString(),
         senderId: auth.currentUser!.uid,
         receiverId:targetUserId,
         timestamp: DateTime.now().toString(),
         readStatus: "",
         imageUrl: imageUrl.value,
         videoUrl: "",
         audioUrl: "",
         documentUrl: "",
         reactions: [],
         replies: [],
       );

       var roomDetails=ChatRoomModel(
         id: roomId,
         lastMessage: message,
         lastMessageTimeStamp: formattedDateTime,
         sender: sender,
         receiver:receiver,
         messages: [],
         timestamp: DateTime.now().toString(),
         unReadMessageNo: 0,
       );



       await fireStore.collection("chats").
       doc(roomId).
       collection("messages").
       doc(chatId).
       set(newChat.toJson(),
       );

      selectedImagePath.value="";
       await fireStore.collection("chats").
       doc(roomId).set(
         roomDetails.toJson(),
       );

       await contactController.saveContact(targetUser);
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

   Stream<UserModel> getStatus(String uid){
     return fireStore.collection("users").doc(uid).snapshots().map((event){
       return UserModel.fromJson(event.data()!);
     });
   }


}
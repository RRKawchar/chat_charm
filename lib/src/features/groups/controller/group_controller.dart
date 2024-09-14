import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/core/routes/app_routes.dart';
import 'package:chat_app_demo/src/core/services/message_service.dart';
import 'package:chat_app_demo/src/core/utils/colors.dart';
import 'package:chat_app_demo/src/features/groups/model/group_model.dart';
import 'package:chat_app_demo/src/features/profile/controller/profile_controller.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController{
  ProfileController profileController=Get.find<ProfileController>();
  final auth=FirebaseAuth.instance;
  final fireStoreDB=FirebaseFirestore.instance;
  RxList<GroupModel> groupList=<GroupModel>[].obs;
  RxList<UserModel> groupMembers=<UserModel>[].obs;
  var uuid=const Uuid();
  RxBool isLoading=false.obs;




  @override
  void onInit() {
    super.onInit();
    getGroup();
  }

  void selectMembers(UserModel user){
  if(groupMembers.contains(user)){
    groupMembers.remove(user);
  }else{
    groupMembers.add(user);
  }
  }


  Future<void> createGroup({required String groupProfilePic,required String groupName})async{
    String groupId=uuid.v6();

   try{
     isLoading.value=true;


     UserModel currentUser = profileController.currentUserList.value;
     if (!groupMembers.contains(currentUser)) {
       groupMembers.add(currentUser);
     }

     String imageUrl=await profileController.uploadImage(imagePath: groupProfilePic);
     var newGroup=GroupModel(
       id: groupId,
       name: groupName,
       profileUrl: imageUrl,
       members: groupMembers,
       createdAt: DateTime.now().toString(),
       createdBy: auth.currentUser!.uid,
       timeStamp: DateTime.now().toString(),
     );


     await fireStoreDB.collection("groups").doc(groupId).set(
       newGroup.toJson(),
     );

     MessageService.successMessage("Group Created!");
     await getGroup();
     Get.offAllNamed(AppRoutes.homePage);
   }catch(e){
     kPrint(e);
   }finally{
     isLoading.value=false;
   }
  }


  Future<void> getGroup()async{
    try{
      isLoading.value=true;
    List<GroupModel> tempGroup=[];
    await fireStoreDB.collection('groups').get().then((value) {
      tempGroup=value.docs.map((e) => GroupModel.fromJson(e.data())).toList();
    });

     groupList.clear();
     groupList.value=tempGroup.where((e) =>e.members!.any((element) => element.id==auth.currentUser!.uid,) ).toList();


    }catch(e){
      kPrint(e);
      throw e.toString();

    }finally{
      isLoading.value=false;
    }

  }



}
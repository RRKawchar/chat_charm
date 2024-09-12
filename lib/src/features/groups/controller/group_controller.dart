import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
import 'package:get/get.dart';

class GroupController extends GetxController{
  RxList<UserModel> groupMembers=<UserModel>[].obs;

  void selectMembers(UserModel user){
  if(groupMembers.contains(user)){
    groupMembers.remove(user);
  }else{
    groupMembers.add(user);
  }
  }
}
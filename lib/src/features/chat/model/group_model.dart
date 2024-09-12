import 'package:chat_app_demo/src/features/profile/model/user_model.dart';
class GroupModel {
  String? id;
  String? name;
  String? description;
  String? profileUrl;
  List<UserModel>? members;
  String? createdAt;
  String? createdBy;
  String? status;
  String? lastMessageTime;
  String? lastMessageBy;
  int? unReadCount;
  String? timeStamp;

  GroupModel(
      {this.id,
        this.name,
        this.description,
        this.profileUrl,
        this.members,
        this.createdAt,
        this.createdBy,
        this.status,
        this.lastMessageTime,
        this.lastMessageBy,
        this.unReadCount,
        this.timeStamp});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    profileUrl = json['profileUrl'];

    if (json['members'] != null) {
      members = (json['members'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      members = [];
    }

    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    status = json['status'];
    lastMessageTime = json['lastMessageTime'];
    lastMessageBy = json['lastMessageBy'];
    unReadCount = json['unReadCount'] ?? 0;
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['profileUrl'] = profileUrl;
    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['status'] = status;
    data['lastMessageTime'] = lastMessageTime;
    data['lastMessageBy'] = lastMessageBy;
    data['unReadCount'] = unReadCount;
    data['timeStamp'] = timeStamp;
    return data;
  }
}

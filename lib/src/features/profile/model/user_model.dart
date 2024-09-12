class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? profilePic;
  String? about;
  String? createAt;
  String? lastOnlineStatus;
  String? status;
  String? role;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.profilePic,
    this.about,
    this.createAt,
    this.lastOnlineStatus,
    this.status,
    this.role,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profilePic = json['profilePic'];
    about = json['about'];
    createAt = json['createAt'];
    lastOnlineStatus = json['lastOnlineStatus'];
    status = json['status'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['profilePic'] = profilePic;
    data['about'] = about;
    data['createAt'] = createAt;
    data['lastOnlineStatus'] = lastOnlineStatus;
    data['status'] = status;
    data['role'] = role;
    return data;
  }
}

import 'package:chat_app_demo/src/features/chat/model/chat_model.dart';
import 'package:chat_app_demo/src/features/profile/model/user_model.dart';

class ChatRoomModel {

    String? id;
    UserModel? sender;
    UserModel? receiver;
    List<ChatModel>? messages;
    int? unReadMessageNo;
    String? lastMessage;
    String? lastMessageTimeStamp;
    String? timestamp;


  ChatRoomModel({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.messages,
    required this.unReadMessageNo,
    required this.lastMessage,
    required this.lastMessageTimeStamp,
    required this.timestamp,
  });


  ChatRoomModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sender = UserModel.fromJson(json['sender']);
    receiver = UserModel.fromJson(json['receiver']);
    if (json['messages'] != null) {
      messages = (json['messages'] as List<dynamic>)
          .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      messages = [];
    }
    unReadMessageNo = json['unReadMessageNo'];
    lastMessage = json['lastMessage'];
    lastMessageTimeStamp = json['lastMessageTimeStamp'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sender'] = sender!.toJson();
    data['receiver'] = receiver!.toJson();
    data['messages'] = messages;
    data['unReadMessageNo'] = unReadMessageNo;
    data['lastMessage'] = lastMessage;
    data['lastMessageTimeStamp'] = lastMessageTimeStamp;
    data['timestamp'] = timestamp;
    return data;
  }
}


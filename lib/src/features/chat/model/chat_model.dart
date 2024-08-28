class ChatModel {
  ChatModel({
    required this.id,
    required this.message,
    required this.senderName,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.readStatus,
    required this.imageUrl,
    required this.videoUrl,
    required this.audioUrl,
    required this.documentUrl,
    required this.reactions,
    required this.replies,
  });
  late final String id;
  late final String message;
  late final String senderName;
  late final String senderId;
  late final String receiverId;
  late final String timestamp;
  late final String readStatus;
  late final String imageUrl;
  late final String videoUrl;
  late final String audioUrl;
  late final String documentUrl;
  late final List<String> reactions;
  late final List<dynamic> replies;

  ChatModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    message = json['message'];
    senderName = json['senderName'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    timestamp = json['timestamp'];
    readStatus = json['readStatus'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    audioUrl = json['audioUrl'];
    documentUrl = json['documentUrl'];
    reactions = List.castFrom<dynamic, String>(json['reactions']);
    replies = List.castFrom<dynamic, dynamic>(json['replies']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['senderName'] = senderName;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['timestamp'] = timestamp;
    data['readStatus'] = readStatus;
    data['imageUrl'] = imageUrl;
    data['videoUrl'] = videoUrl;
    data['audioUrl'] = audioUrl;
    data['documentUrl'] = documentUrl;
    data['reactions'] = reactions;
    data['replies'] = replies;
    return data;
  }
}
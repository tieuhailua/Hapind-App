import 'package:hapind/model/message.dart';
import 'package:hapind/model/user_conversation.dart';
import 'package:hapind/model/video_call.dart';
import 'package:hapind/service/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversation.g.dart';

@JsonSerializable(explicitToJson: true)
class Conversation {
  int? id;
  String? type;
  @TimestampConverter()
  DateTime? createdAt;
  Set<Message>? messages;
  Set<VideoCall>? videoCalls;
  Set<UserConversation>? userConversations;

  Conversation({
    this.id,
    this.type,
    this.createdAt,
    this.messages,
    this.videoCalls,
    this.userConversations,
  });

  // Conversation.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       type = json['type'],
  //       createdAt = DateTime.parse(json['createdAt']),
  //       messages = (json['messages'] as List<dynamic>?)
  //           ?.map((messageJson) => Message.fromJson(messageJson))
  //           ?.toSet(),
  //       videoCalls = (json['videoCalls'] as List<dynamic>?)
  //           ?.map((videoCallJson) => VideoCall.fromJson(videoCallJson))
  //           ?.toSet(),
  //       userConversations = (json['userConversations'] as List<dynamic>?)
  //           ?.map((userConvJson) => UserConversation.fromJson(userConvJson))
  //           ?.toSet(); 
  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

 Map<String, dynamic> toJson() => _$ConversationToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'createdAt': createdAt?.toIso8601String(),
      'messages': messages?.map((message) => message.toMap())?.toList(),
      'videoCalls': videoCalls?.map((videoCall) => videoCall.toMap())?.toList(),
      'userConversations': userConversations?.map((userConv) => userConv.toMap())?.toList(),
    };
  }
}

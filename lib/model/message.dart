import 'package:hapind/model/conversation.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/service/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  int? id;
  Conversation? conversation;
  User? user;
  String? content;
  @TimestampConverter()
  DateTime? sentAt;

  Message({
    this.id,
    this.conversation,
    this.user,
    this.content,
    this.sentAt,
  });

  // Message.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       conversation = Conversation.fromJson(json['conversation']),
  //       user = User.fromJson(json['user']),
  //       content = json['content'],
  //       sentAt = DateTime.parse(json['sentAt']);
  factory Message.fromJson(Map<String, dynamic> json)=> _$MessageFromJson(json);

 Map<String, dynamic> toJson() => _$MessageToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'conversation': conversation?.toMap(),
      'user': user?.toMap(),
      'content': content,
      'sentAt': sentAt?.toIso8601String(),
    };
  }
}

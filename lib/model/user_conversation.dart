import 'package:hapind/model/conversation.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_conversation.g.dart';

@JsonSerializable(explicitToJson: true)
class UserConversation {
  int? id;
  Conversation? conversation;
  User? user;
  String? role;

  UserConversation({
    this.id,
    this.conversation,
    this.user,
    this.role,
  });

  // UserConversation.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       conversation = Conversation.fromJson(json['conversation']),
  //       user = User.fromJson(json['user']),
  //       role = json['role'];
  
factory UserConversation.fromJson(Map<String, dynamic> json)=> _$UserConversationFromJson(json);

 Map<String, dynamic> toJson() => _$UserConversationToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'conversation': conversation?.toMap(),
      'user': user?.toMap(),
      'role': role,
    };
  }
}

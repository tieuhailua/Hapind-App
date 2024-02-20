import 'package:hapind/model/conversation.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/service/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'video_call.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoCall {
  int? id;
  Conversation? conversation;
  User? userByReceiverId;
  User? userByCallerId;
  @TimestampConverter()
  DateTime? startTime;
  @TimestampConverter()
  DateTime? endTime;

  VideoCall({
    this.id,
    this.conversation,
    this.userByReceiverId,
    this.userByCallerId,
    this.startTime,
    this.endTime,
  });
  factory VideoCall.fromJson(Map<String, dynamic> json)=> _$VideoCallFromJson(json);

 Map<String, dynamic> toJson() => _$VideoCallToJson(this);
  // VideoCall.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       conversation = Conversation.fromJson(json['conversation']),
  //       userByReceiverId = User.fromJson(json['userByReceiverId']),
  //       userByCallerId = User.fromJson(json['userByCallerId']),
  //       startTime = DateTime.parse(json['startTime']),
  //       endTime = DateTime.parse(json['endTime']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'conversation': conversation?.toMap(),
      'userByReceiverId': userByReceiverId?.toMap(),
      'userByCallerId': userByCallerId?.toMap(),
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
    };
  }
}

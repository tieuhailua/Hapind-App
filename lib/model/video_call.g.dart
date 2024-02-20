// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCall _$VideoCallFromJson(Map<String, dynamic> json) => VideoCall(
      id: json['id'] as int?,
      conversation: json['conversation'] == null
          ? null
          : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
      userByReceiverId: json['userByReceiverId'] == null
          ? null
          : User.fromJson(json['userByReceiverId'] as Map<String, dynamic>),
      userByCallerId: json['userByCallerId'] == null
          ? null
          : User.fromJson(json['userByCallerId'] as Map<String, dynamic>),
      startTime: const TimestampConverter().fromJson(json['startTime'] as int?),
      endTime: const TimestampConverter().fromJson(json['endTime'] as int?),
    );

Map<String, dynamic> _$VideoCallToJson(VideoCall instance) => <String, dynamic>{
      'id': instance.id,
      'conversation': instance.conversation?.toJson(),
      'userByReceiverId': instance.userByReceiverId?.toJson(),
      'userByCallerId': instance.userByCallerId?.toJson(),
      'startTime': const TimestampConverter().toJson(instance.startTime),
      'endTime': const TimestampConverter().toJson(instance.endTime),
    };

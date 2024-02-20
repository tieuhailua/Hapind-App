// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int?,
      conversation: json['conversation'] == null
          ? null
          : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String?,
      sentAt: const TimestampConverter().fromJson(json['sentAt'] as int?),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'conversation': instance.conversation?.toJson(),
      'user': instance.user?.toJson(),
      'content': instance.content,
      'sentAt': const TimestampConverter().toJson(instance.sentAt),
    };

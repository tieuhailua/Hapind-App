// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: json['id'] as int?,
      type: json['type'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt'] as int?),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toSet(),
      videoCalls: (json['videoCalls'] as List<dynamic>?)
          ?.map((e) => VideoCall.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userConversations: (json['userConversations'] as List<dynamic>?)
          ?.map((e) => UserConversation.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'videoCalls': instance.videoCalls?.map((e) => e.toJson()).toList(),
      'userConversations':
          instance.userConversations?.map((e) => e.toJson()).toList(),
    };

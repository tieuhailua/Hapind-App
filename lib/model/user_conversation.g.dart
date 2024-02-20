// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConversation _$UserConversationFromJson(Map<String, dynamic> json) =>
    UserConversation(
      id: json['id'] as int?,
      conversation: json['conversation'] == null
          ? null
          : Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserConversationToJson(UserConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation': instance.conversation?.toJson(),
      'user': instance.user?.toJson(),
      'role': instance.role,
    };

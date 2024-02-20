// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLanguage _$UserLanguageFromJson(Map<String, dynamic> json) => UserLanguage(
      id: json['id'] as int?,
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      choose: json['choose'] as bool?,
    );

Map<String, dynamic> _$UserLanguageToJson(UserLanguage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language?.toJson(),
      'user': instance.user?.toJson(),
      'choose': instance.choose,
    };

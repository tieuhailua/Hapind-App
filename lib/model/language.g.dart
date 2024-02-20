// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userLanguages: (json['userLanguages'] as List<dynamic>?)
          ?.map((e) => UserLanguage.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userLanguages': instance.userLanguages?.map((e) => e.toJson()).toList(),
    };

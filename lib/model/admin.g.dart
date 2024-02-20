// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      id: json['id'] as int?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      banneds: (json['banneds'] as List<dynamic>?)
          ?.map((e) => Banned.fromJson(e as Map<String, dynamic>))
          .toSet(),
      blogs: (json['blogs'] as List<dynamic>?)
          ?.map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'role': instance.role,
      'banneds': instance.banneds?.map((e) => e.toJson()).toList(),
      'blogs': instance.blogs?.map((e) => e.toJson()).toList(),
    };

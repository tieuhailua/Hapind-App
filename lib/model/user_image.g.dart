// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserImage _$UserImageFromJson(Map<String, dynamic> json) => UserImage(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$UserImageToJson(UserImage instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'imagePath': instance.imagePath,
    };

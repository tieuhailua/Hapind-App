// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogImage _$BlogImageFromJson(Map<String, dynamic> json) => BlogImage(
      id: json['id'] as int?,
      blog: json['blog'] == null
          ? null
          : Blog.fromJson(json['blog'] as Map<String, dynamic>),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$BlogImageToJson(BlogImage instance) => <String, dynamic>{
      'id': instance.id,
      'blog': instance.blog?.toJson(),
      'imagePath': instance.imagePath,
    };

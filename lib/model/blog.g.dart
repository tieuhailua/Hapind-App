// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      id: json['id'] as int?,
      admin: json['admin'] == null
          ? null
          : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      title: json['title'] as String?,
      brief: json['brief'] as String?,
      content: json['content'] as String?,
      publishDate:
          const TimestampConverter().fromJson(json['publishDate'] as int?),
      status: json['status'] as String?,
      blogImages: (json['blogImages'] as List<dynamic>?)
          ?.map((e) => BlogImage.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'id': instance.id,
      'admin': instance.admin?.toJson(),
      'title': instance.title,
      'brief': instance.brief,
      'content': instance.content,
      'publishDate': const TimestampConverter().toJson(instance.publishDate),
      'status': instance.status,
      'blogImages': instance.blogImages?.map((e) => e.toJson()).toList(),
    };

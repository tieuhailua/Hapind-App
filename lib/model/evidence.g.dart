// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evidence _$EvidenceFromJson(Map<String, dynamic> json) => Evidence(
      id: json['id'] as int?,
      report: json['report'] == null
          ? null
          : Report.fromJson(json['report'] as Map<String, dynamic>),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$EvidenceToJson(Evidence instance) => <String, dynamic>{
      'id': instance.id,
      'report': instance.report?.toJson(),
      'image': instance.image,
    };

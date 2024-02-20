// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as int?,
      reason: json['reason'] == null
          ? null
          : Reason.fromJson(json['reason'] as Map<String, dynamic>),
      userByReportedId: json['userByReportedId'] == null
          ? null
          : User.fromJson(json['userByReportedId'] as Map<String, dynamic>),
      userByReporterId: json['userByReporterId'] == null
          ? null
          : User.fromJson(json['userByReporterId'] as Map<String, dynamic>),
      description: json['description'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt'] as int?),
      evidences: (json['evidences'] as List<dynamic>?)
          ?.map((e) => Evidence.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason?.toJson(),
      'userByReportedId': instance.userByReportedId?.toJson(),
      'userByReporterId': instance.userByReporterId?.toJson(),
      'description': instance.description,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'evidences': instance.evidences?.map((e) => e.toJson()).toList(),
    };

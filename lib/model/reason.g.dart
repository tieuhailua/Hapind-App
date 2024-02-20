// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reason _$ReasonFromJson(Map<String, dynamic> json) => Reason(
      id: json['id'] as int?,
      name: json['name'] as String?,
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toSet(),
      banneds: (json['banneds'] as List<dynamic>?)
          ?.map((e) => Banned.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$ReasonToJson(Reason instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'reports': instance.reports?.map((e) => e.toJson()).toList(),
      'banneds': instance.banneds?.map((e) => e.toJson()).toList(),
    };

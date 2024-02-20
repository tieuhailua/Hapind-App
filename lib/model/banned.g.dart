// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banned _$BannedFromJson(Map<String, dynamic> json) => Banned(
      id: json['id'] as int?,
      admin: json['admin'] == null
          ? null
          : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      reason: json['reason'] == null
          ? null
          : Reason.fromJson(json['reason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannedToJson(Banned instance) => <String, dynamic>{
      'id': instance.id,
      'admin': instance.admin?.toJson(),
      'user': instance.user?.toJson(),
      'reason': instance.reason?.toJson(),
    };

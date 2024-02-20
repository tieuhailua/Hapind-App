// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Matching _$MatchingFromJson(Map<String, dynamic> json) => Matching(
      id: json['id'] as int?,
      userBySecondUserId: json['userBySecondUserId'] == null
          ? null
          : User.fromJson(json['userBySecondUserId'] as Map<String, dynamic>),
      userByFirstUserId: json['userByFirstUserId'] == null
          ? null
          : User.fromJson(json['userByFirstUserId'] as Map<String, dynamic>),
      statusId: json['statusId'] as int?,
    );

Map<String, dynamic> _$MatchingToJson(Matching instance) => <String, dynamic>{
      'id': instance.id,
      'userBySecondUserId': instance.userBySecondUserId?.toJson(),
      'userByFirstUserId': instance.userByFirstUserId?.toJson(),
      'statusId': instance.statusId,
    };

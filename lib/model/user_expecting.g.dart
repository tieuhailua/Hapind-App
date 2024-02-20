// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_expecting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserExpecting _$UserExpectingFromJson(Map<String, dynamic> json) =>
    UserExpecting(
      id: json['id'] as int?,
      expecting: json['expecting'] == null
          ? null
          : Expecting.fromJson(json['expecting'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      choose: json['choose'] as bool?,
    );

Map<String, dynamic> _$UserExpectingToJson(UserExpecting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expecting': instance.expecting?.toJson(),
      'user': instance.user?.toJson(),
      'choose': instance.choose,
    };

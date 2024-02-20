// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserExercise _$UserExerciseFromJson(Map<String, dynamic> json) => UserExercise(
      id: json['id'] as int?,
      exercise: json['exercise'] == null
          ? null
          : Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      choose: json['choose'] as bool?,
    );

Map<String, dynamic> _$UserExerciseToJson(UserExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise': instance.exercise?.toJson(),
      'user': instance.user?.toJson(),
      'choose': instance.choose,
    };

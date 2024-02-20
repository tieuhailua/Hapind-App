// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userExercises: (json['userExercises'] as List<dynamic>?)
          ?.map((e) => UserExercise.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userExercises': instance.userExercises?.map((e) => e.toJson()).toList(),
    };

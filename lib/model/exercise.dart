import 'package:hapind/model/user_exercise.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class Exercise {
  int? id;
  String? name;
  Set<UserExercise>? userExercises;

  Exercise({
    this.id,
    this.name,
    this.userExercises,
  });

  // Exercise.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       userExercises = (json['userExercises'] as List<dynamic>?)
  //           ?.map((userExerciseJson) => UserExercise.fromJson(userExerciseJson))
  //           ?.toSet();
factory Exercise.fromJson(Map<String, dynamic> json)=> _$ExerciseFromJson(json);

 Map<String, dynamic> toJson() => _$ExerciseToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userExercises': userExercises?.map((userExercise) => userExercise.toMap())?.toList(),
    };
  }
}

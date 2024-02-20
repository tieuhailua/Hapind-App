import 'package:hapind/model/exercise.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_exercise.g.dart';

@JsonSerializable(explicitToJson: true)
class UserExercise {
  int? id;
  Exercise? exercise;
  User? user;
  bool? choose;

  UserExercise({
    this.id,
    this.exercise,
    this.user,
    this.choose,
  });

  // UserExercise.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       exercise = Exercise.fromJson(json['exercise']),
  //       user = User.fromJson(json['user']),
  //       choose = json['choose'];
  
factory UserExercise.fromJson(Map<String, dynamic> json)=> _$UserExerciseFromJson(json);

 Map<String, dynamic> toJson() => _$UserExerciseToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise': exercise?.toMap(),
      'user': user?.toMap(),
      'choose': choose,
    };
  }
}

import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'habit.g.dart';

@JsonSerializable(explicitToJson: true)
class Habit {
  int? id;
  String? name;
  Set<User>? users;

  Habit({
    this.id,
    this.name,
    this.users,
  });

  // Habit.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           ?.toSet();
  factory Habit.fromJson(Map<String, dynamic> json)=> _$HabitFromJson(json);

 Map<String, dynamic> toJson() => _$HabitToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap())?.toList(),
    };
  }
}

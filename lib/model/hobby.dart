import 'package:hapind/model/user_hobby.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hobby.g.dart';

@JsonSerializable(explicitToJson: true)
class Hobby {
  int? id;
  String? name;
  Set<UserHobby>? userHobbies;

  Hobby({
    this.id,
    this.name,
    this.userHobbies,
  });

  // Hobby.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       userHobbies = (json['userHobbies'] as List<dynamic>?)
  //           ?.map((userHobbyJson) => UserHobby.fromJson(userHobbyJson))
  //           ?.toSet();
  factory Hobby.fromJson(Map<String, dynamic> json)=> _$HobbyFromJson(json);

 Map<String, dynamic> toJson() => _$HobbyToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userHobbies': userHobbies?.map((userHobby) => userHobby.toMap())?.toList(),
    };
  }
}

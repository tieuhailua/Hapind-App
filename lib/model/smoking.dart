import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'smoking.g.dart';

@JsonSerializable(explicitToJson: true)
class Smoking {
  int? id;
  String? name;
  Set<User>? users;

  Smoking({
    this.id,
    this.name,
    this.users,
  });

  // Smoking.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           ?.toSet();
  factory Smoking.fromJson(Map<String, dynamic> json)=> _$SmokingFromJson(json);

 Map<String, dynamic> toJson() => _$SmokingToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap())?.toList(),
    };
  }
}

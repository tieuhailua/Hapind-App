import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'drinking.g.dart';

@JsonSerializable(explicitToJson: true)
class Drinking {
  int? id;
  String? name;
  Set<User>? users;

  Drinking({
    this.id,
    this.name,
    this.users,
  });

  // Drinking.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           ?.toSet();
  factory Drinking.fromJson(Map<String, dynamic> json) => _$DrinkingFromJson(json);

 Map<String, dynamic> toJson() => _$DrinkingToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap())?.toList(),
    };
  }
}

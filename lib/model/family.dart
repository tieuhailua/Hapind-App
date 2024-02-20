import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'family.g.dart';

@JsonSerializable(explicitToJson: true)
class Family {
  int? id;
  String? name;
  Set<User>? users;

  Family({
    this.id,
    this.name,
    this.users,
  });

  // Family.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           ?.toSet();
  factory Family.fromJson(Map<String, dynamic> json)=> _$FamilyFromJson(json);

 Map<String, dynamic> toJson() => _$FamilyToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap())?.toList(),
    };
  }
}

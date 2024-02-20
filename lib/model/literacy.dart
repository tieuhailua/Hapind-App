import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'literacy.g.dart';

@JsonSerializable(explicitToJson: true)
class Literacy {
  int? id;
  String? name;
  Set<User>? users;

  Literacy({
    this.id,
    this.name,
    this.users,
  });

  // Literacy.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           ?.toSet();
  factory Literacy.fromJson(Map<String, dynamic> json)=> _$LiteracyFromJson(json);

 Map<String, dynamic> toJson() => _$LiteracyToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap())?.toList(),
    };
  }
}

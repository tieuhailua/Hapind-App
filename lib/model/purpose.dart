import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'purpose.g.dart';

@JsonSerializable(explicitToJson: true)
class Purpose {
  int? id;
  String? name;
  Set<User>? users;

  Purpose({
    this.id,
    this.name,
    this.users,
  });

  // Purpose.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           .toSet();
  factory Purpose.fromJson(Map<String, dynamic> json)=> _$PurposeFromJson(json);

 Map<String, dynamic> toJson() => _$PurposeToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap()).toList(),
    };
  }
}

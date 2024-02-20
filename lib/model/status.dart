import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'status.g.dart';

@JsonSerializable(explicitToJson: true)
class Status {
  int? id;
  String? name;
  Set<User>? users;

  Status({
    this.id,
    this.name,
    this.users,
  });

  // Status.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           ?.toSet();
  
factory Status.fromJson(Map<String, dynamic> json)=> _$StatusFromJson(json);

 Map<String, dynamic> toJson() => _$StatusToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap())?.toList(),
    };
  }
}

import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'work.g.dart';

@JsonSerializable(explicitToJson: true)
class Work {
  int? id;
  String? name;
  Set<User>? users;

  Work({
    this.id,
    this.name,
    this.users,
  });

  // Work.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       users = (json['users'] as List<dynamic>?)
  //           ?.map((userJson) => User.fromJson(userJson))
  //           ?.toSet();
  
  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);


  Map<String, dynamic> toJson() => _$WorkToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'users': users?.map((user) => user.toMap())?.toList(),
    };
  }
}

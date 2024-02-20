import 'package:hapind/model/expecting.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_expecting.g.dart';

@JsonSerializable(explicitToJson: true)
class UserExpecting {
  int? id;
  Expecting? expecting;
  User? user;
  bool? choose;

  UserExpecting({
    this.id,
    this.expecting,
    this.user,
    this.choose,
  });

  // UserExpecting.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       expecting = Expecting.fromJson(json['expecting']),
  //       user = User.fromJson(json['user']),
  //       choose = json['choose'];

factory UserExpecting.fromJson(Map<String, dynamic> json)=> _$UserExpectingFromJson(json);

 Map<String, dynamic> toJson() => _$UserExpectingToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expecting': expecting?.toMap(),
      'user': user?.toMap(),
      'choose': choose,
    };
  }
}

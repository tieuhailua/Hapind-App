import 'package:hapind/model/hobby.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_hobby.g.dart';

@JsonSerializable(explicitToJson: true)
class UserHobby {
  int? id;
  Hobby? hobby;
  User? user;
  bool? choose;

  UserHobby({
    this.id,
    this.hobby,
    this.user,
    this.choose,
  });

  // UserHobby.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       hobby = Hobby.fromJson(json['hobby']),
  //       user = User.fromJson(json['user']),
  //       choose = json['choose'];
  
factory UserHobby.fromJson(Map<String, dynamic> json)=> _$UserHobbyFromJson(json);

 Map<String, dynamic> toJson() => _$UserHobbyToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hobby': hobby?.toMap(),
      'user': user?.toMap(),
      'choose': choose,
    };
  }
}

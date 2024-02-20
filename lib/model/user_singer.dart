import 'package:hapind/model/singer.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_singer.g.dart';

@JsonSerializable(explicitToJson: true)
class UserSinger {
  int? id;
  Singer? singer;
  User? user;
  bool? choose;

  UserSinger({
    this.id,
    this.singer,
    this.user,
    this.choose,
  });

  // UserSinger.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       singer = Singer.fromJson(json['singer']),
  //       user = User.fromJson(json['user']),
  //       choose = json['choose'];
  factory UserSinger.fromJson(Map<String, dynamic> json)=> _$UserSingerFromJson(json);

 Map<String, dynamic> toJson() => _$UserSingerToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'singer': singer?.toMap(),
      'user': user?.toMap(),
      'choose': choose,
    };
  }
}

import 'package:hapind/model/user_singer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'singer.g.dart';

@JsonSerializable(explicitToJson: true)
class Singer {
  int? id;
  String? name;
  Set<UserSinger>? userSingers;

  Singer({
    this.id,
    this.name,
    this.userSingers,
  });

  // Singer.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       userSingers = (json['userSingers'] as List<dynamic>?)
  //           ?.map((userSingerJson) => UserSinger.fromJson(userSingerJson))
  //           ?.toSet();
  factory Singer.fromJson(Map<String, dynamic> json)=> _$SingerFromJson(json);

 Map<String, dynamic> toJson() => _$SingerToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userSingers': userSingers?.map((userSinger) => userSinger.toMap())?.toList(),
    };
  }
}

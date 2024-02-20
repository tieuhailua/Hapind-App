import 'package:hapind/model/user_music.dart';
import 'package:json_annotation/json_annotation.dart';
part 'music.g.dart';

@JsonSerializable(explicitToJson: true)
class Music {
  int? id;
  String? name;
  Set<UserMusic>? userMusics;

  Music({
    this.id,
    this.name,
    this.userMusics,
  });

  // Music.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       userMusics = (json['userMusics'] as List<dynamic>?)
  //           ?.map((userMusicJson) => UserMusic.fromJson(userMusicJson))
  //           ?.toSet();
  factory Music.fromJson(Map<String, dynamic> json)=> _$MusicFromJson(json);

 Map<String, dynamic> toJson() => _$MusicToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userMusics': userMusics?.map((userMusic) => userMusic.toMap())?.toList(),
    };
  }
}

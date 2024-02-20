import 'package:hapind/model/music.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_music.g.dart';

@JsonSerializable(explicitToJson: true)
class UserMusic {
  int? id;
  Music? music;
  User? user;
  bool? choose;

  UserMusic({
    this.id,
    this.music,
    this.user,
    this.choose,
  });

 
  // UserMusic.fromJson(Map<String, dynamic> json)
    //     : id = json['id'],
    //       music = Music.fromJson(json['music']),
    //       user = User.fromJson(json['user']),
    //       choose = json['choose'];
    
factory UserMusic.fromJson(Map<String, dynamic> json)=> _$UserMusicFromJson(json);

 Map<String, dynamic> toJson() => _$UserMusicToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'music': music?.toMap(),
      'user': user?.toMap(),
      'choose': choose,
    };
  }
}

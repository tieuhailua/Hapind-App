import 'package:hapind/model/language.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_language.g.dart';

@JsonSerializable(explicitToJson: true)
class UserLanguage {
  int? id;
  Language? language;
  User? user;
  bool? choose;

  UserLanguage({
    this.id,
    this.language,
    this.user,
    this.choose,
  });

  // UserLanguage.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       language = Language.fromJson(json['language']),
  //       user = User.fromJson(json['user']),
  //       choose = json['choose'];

factory UserLanguage.fromJson(Map<String, dynamic> json)=> _$UserLanguageFromJson(json);

 Map<String, dynamic> toJson() => _$UserLanguageToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'language': language?.toMap(),
      'user': user?.toMap(),
      'choose': choose,
    };
  }
}

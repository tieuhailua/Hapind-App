import 'package:hapind/model/user_language.dart';
import 'package:json_annotation/json_annotation.dart';
part 'language.g.dart';

@JsonSerializable(explicitToJson: true)
class Language {
  int? id;
  String? name;
  Set<UserLanguage>? userLanguages;

  Language({
    this.id,
    this.name,
    this.userLanguages,
  });

  // Language.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       userLanguages = (json['userLanguages'] as List<dynamic>?)
  //           ?.map((userLanguageJson) => UserLanguage.fromJson(userLanguageJson))
  //           ?.toSet();
  factory Language.fromJson(Map<String, dynamic> json)=> _$LanguageFromJson(json);

 Map<String, dynamic> toJson() => _$LanguageToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userLanguages': userLanguages?.map((userLanguage) => userLanguage.toMap())?.toList(),
    };
  }
}

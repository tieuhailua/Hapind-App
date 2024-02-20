import 'package:hapind/model/user_expecting.dart';
import 'package:json_annotation/json_annotation.dart';
part 'expecting.g.dart';

@JsonSerializable(explicitToJson: true)
class Expecting {
  int? id;
  String? name;
  Set<UserExpecting>? userExpectings;

  Expecting({
    this.id,
    this.name,
    this.userExpectings,
  });

  // Expecting.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       userExpectings = (json['userExpectings'] as List<dynamic>?)
  //           ?.map((userExpectingJson) => UserExpecting.fromJson(userExpectingJson))
  //           ?.toSet();
  factory Expecting.fromJson(Map<String, dynamic> json)=> _$ExpectingFromJson(json);

 Map<String, dynamic> toJson() => _$ExpectingToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userExpectings': userExpectings?.map((userExpecting) => userExpecting.toMap())?.toList(),
    };
  }
}

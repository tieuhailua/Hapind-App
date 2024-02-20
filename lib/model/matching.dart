import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'matching.g.dart';

@JsonSerializable(explicitToJson: true)
class Matching {
  int? id;
  User? userBySecondUserId;
  User? userByFirstUserId;
  int? statusId;

  Matching({
    this.id,
    this.userBySecondUserId,
    this.userByFirstUserId,
    this.statusId,
  });

  // Matching.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       userBySecondUserId = User.fromJson(json['userBySecondUserId']),
  //       userByFirstUserId = User.fromJson(json['userByFirstUserId']),
  //       statusId = json['statusId'];
  factory Matching.fromJson(Map<String, dynamic> json)=> _$MatchingFromJson(json);

 Map<String, dynamic> toJson() => _$MatchingToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userBySecondUserId': userBySecondUserId?.toMap(),
      'userByFirstUserId': userByFirstUserId?.toMap(),
      'statusId': statusId,
    };
  }
}

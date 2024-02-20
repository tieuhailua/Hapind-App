import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'block.g.dart';

@JsonSerializable(explicitToJson: true)
class Block {
  int? id;
  User? userByBlockedId;
  User? userByUseId;

  Block({
    this.id,
    this.userByBlockedId,
    this.userByUseId,
  });

  // Block.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       userByBlockedId = User.fromJson(json['userByBlockedId']),
  //       userByUseId = User.fromJson(json['userByUseId']);
  factory Block.fromJson(Map<String, dynamic> json)=> _$BlockFromJson(json);

 Map<String, dynamic> toJson() => _$BlockToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userByBlockedId': userByBlockedId?.toMap(),
      'userByUseId': userByUseId?.toMap(),
    };
  }
}

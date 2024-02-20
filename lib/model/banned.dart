import 'package:hapind/model/admin.dart';
import 'package:hapind/model/reason.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banned.g.dart';

@JsonSerializable(explicitToJson: true)
class Banned {
  int? id;
  Admin? admin;
  User? user;
  Reason? reason;

  Banned({
    this.id,
    this.admin,
    this.user,
    this.reason,
  });

  // Banned.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       admin = Admin.fromJson(json['admin']),
  //       user = User.fromJson(json['user']),
  //       reason = Reason.fromJson(json['reason']);
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'admin': admin?.toMap(),
      'user': user?.toMap(),
      'reason': reason?.toMap(),
    };
  }
    factory Banned.fromJson(Map<String, dynamic> json) => _$BannedFromJson(json);
    Map<String, dynamic> toJson() => _$BannedToJson(this);
}

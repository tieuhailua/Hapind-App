import 'package:hapind/model/evidence.dart';
import 'package:hapind/model/reason.dart';
import 'package:hapind/model/user.dart';
import 'package:hapind/service/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'report.g.dart';

@JsonSerializable(explicitToJson: true)
class Report {
  int? id;
  Reason? reason;
  User? userByReportedId;
  User? userByReporterId;
  String? description;
  @TimestampConverter()
  DateTime? createdAt;
  Set<Evidence>? evidences;

  Report({
    this.id,
    this.reason,
    this.userByReportedId,
    this.userByReporterId,
    this.description,
    this.createdAt,
    this.evidences,
  });

  // Report.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       reason = Reason.fromJson(json['reason']),
  //       userByReportedId = User.fromJson(json['userByReportedId']),
  //       userByReporterId = User.fromJson(json['userByReporterId']),
  //       description = json['description'],
  //       createdAt = DateTime.parse(json['createdAt']),
  //       evidences = (json['evidences'] as List<dynamic>?)
  //           ?.map((evidenceJson) => Evidence.fromJson(evidenceJson))
  //           ?.toSet();
  factory Report.fromJson(Map<String, dynamic> json)=> _$ReportFromJson(json);

 Map<String, dynamic> toJson() => _$ReportToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reason': reason?.toMap(),
      'userByReportedId': userByReportedId?.toMap(),
      'userByReporterId': userByReporterId?.toMap(),
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
      'evidences': evidences?.map((evidence) => evidence.toMap())?.toList(),
    };
  }
}

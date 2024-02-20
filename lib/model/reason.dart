import 'package:hapind/model/banned.dart';
import 'package:hapind/model/report.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reason.g.dart';

@JsonSerializable(explicitToJson: true)
class Reason {
  int? id;
  String? name;
  Set<Report>? reports;
  Set<Banned>? banneds;

  Reason({
    this.id,
    this.name,
    this.reports,
    this.banneds,
  });

  // Reason.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       reports = (json['reports'] as List<dynamic>?)
  //           ?.map((reportJson) => Report.fromJson(reportJson))
  //           ?.toSet(),
  //           banneds = (json['banneds'] as List<dynamic>?)
  //           ?.map((reportJson) => Banned.fromJson(reportJson))
  //           ?.toSet();
  factory Reason.fromJson(Map<String, dynamic> json)=> _$ReasonFromJson(json);

 Map<String, dynamic> toJson() => _$ReasonToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'reports': reports?.map((report) => report.toMap()).toList(),
      'banneds': banneds?.map((banneds) => banneds.toMap()).toList(),
    };
  }
}

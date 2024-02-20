import 'package:hapind/model/report.dart';
import 'package:json_annotation/json_annotation.dart';
part 'evidence.g.dart';

@JsonSerializable(explicitToJson: true)
class Evidence {
  int? id;
  Report? report;
  String? image;

  Evidence({
    this.id,
    this.report,
    this.image,
  });

  // Evidence.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       report = Report.fromJson(json['report']),
  //       image = json['image'];
  factory Evidence.fromJson(Map<String, dynamic> json)=> _$EvidenceFromJson(json);

 Map<String, dynamic> toJson() => _$EvidenceToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'report': report?.toMap(),
      'image': image,
    };
  }
}

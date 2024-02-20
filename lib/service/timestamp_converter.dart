import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime?, int?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(int? timestamp) {
    return timestamp != null ? DateTime.fromMillisecondsSinceEpoch(timestamp,isUtc: true) : null;
  }

  @override
  int? toJson(DateTime? date) {
    return date != null ? date.millisecondsSinceEpoch ~/ 1000 : null;
  }

  // @override
  // DateTime? fromJson(int? timestamp) {
  //   return timestamp != null
  //       ? DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true)
  //           .toLocal()
  //       : null;
  // }

  // @override
  // int? toJson(DateTime? date) {
  //   return date != null ? date.millisecondsSinceEpoch ~/ 1000 : null;
  // }
}

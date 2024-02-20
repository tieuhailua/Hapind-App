import 'package:hapind/model/banned.dart';
import 'package:hapind/model/block.dart';
import 'package:hapind/model/drinking.dart';
import 'package:hapind/model/family.dart';
import 'package:hapind/model/habit.dart';
import 'package:hapind/model/literacy.dart';
import 'package:hapind/model/matching.dart';
import 'package:hapind/model/message.dart';
import 'package:hapind/model/purpose.dart';
import 'package:hapind/model/report.dart';
import 'package:hapind/model/smoking.dart';
import 'package:hapind/model/status.dart';
import 'package:hapind/model/user_conversation.dart';
import 'package:hapind/model/user_exercise.dart';
import 'package:hapind/model/user_expecting.dart';
import 'package:hapind/model/user_hobby.dart';
import 'package:hapind/model/user_image.dart';
import 'package:hapind/model/user_language.dart';
import 'package:hapind/model/user_music.dart';
import 'package:hapind/model/user_pet.dart';
import 'package:hapind/model/user_singer.dart';
import 'package:hapind/model/video_call.dart';
import 'package:hapind/model/work.dart';
import 'package:hapind/service/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  int? id;
  Drinking? drinking;
  Family? family;
  Habit? habit;
  Literacy? literacy;
  Purpose? purpose;
  Smoking? smoking;
  Status? status;
  Work? work;
  String? email;
  String? phone;
  String? password;
  String? fullname;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  @TimestampConverter()
  DateTime? dob;
  String? gender;
  String? finding;
  int? distance;
  String? address;
  String? school;
  String? description;
  int? height;
  int? weight;
  String? zodiac;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  @TimestampConverter()
  DateTime? createTime;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  @TimestampConverter()
  DateTime? lastLogin;
  bool? online;
  Set<Matching>? matchingsForSecondUserId;
  Set<Report>? reportsForReportedId;
  Set<UserConversation>? userConversations;
  Set<UserExercise>? userExercises;
  Set<VideoCall>? videoCallsForReceiverId;
  Set<Message>? messages;
  Set<UserHobby>? userHobbies;
  Set<Block>? blocksForBlockedId;
  Set<UserImage>? userImages;
  Set<Matching>? matchingsForFirstUserId;
  Set<UserLanguage>? userLanguages;
  Set<VideoCall>? videoCallsForCallerId;
  Set<Block>? blocksForUseId;
  Set<UserExpecting>? userExpectings;
  Set<Banned>? banneds;
  Set<UserPet>? userPets;
  Set<UserSinger>? userSingers;
  Set<Report>? reportsForReporterId;
  Set<UserMusic>? userMusics;

  String getUserImagesAsString() {
    return userImages?.map((image) => image.imagePath).join(', ') ?? '';
  }

  // static DateTime? _fromJson(int? timestamp) {
  //   return timestamp != null
  //       ? DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)
  //       : null;
  // }

//   static DateTime? _fromJson(int? timestamp) {
//   return timestamp != null
//       ? DateTime.fromMillisecondsSinceEpoch(timestamp)
//       : null;
// }

  static DateTime? _fromJson(int? timestamp) {
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true)
        : null;
  }

  static int? _toJson(DateTime? date) {
    return date != null ? date.millisecondsSinceEpoch ~/ 1000 : null;
  }

  User({
    this.id,
    this.drinking,
    this.family,
    this.habit,
    this.literacy,
    this.purpose,
    this.smoking,
    this.status,
    this.work,
    this.email,
    this.phone,
    this.password,
    this.fullname,
    this.dob,
    this.gender,
    this.finding,
    this.distance,
    this.address,
    this.school,
    this.description,
    this.height,
    this.weight,
    this.zodiac,
    this.createTime,
    this.lastLogin,
    this.online,
    this.matchingsForSecondUserId,
    this.reportsForReportedId,
    this.userConversations,
    this.userExercises,
    this.videoCallsForReceiverId,
    this.messages,
    this.userHobbies,
    this.blocksForBlockedId,
    this.userImages,
    this.matchingsForFirstUserId,
    this.userLanguages,
    this.videoCallsForCallerId,
    this.blocksForUseId,
    this.userExpectings,
    this.banneds,
    this.userPets,
    this.userSingers,
    this.reportsForReporterId,
    this.userMusics,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'drinking': drinking?.toMap(),
      'family': family?.toMap(),
      'habit': habit?.toMap(),
      'literacy': literacy?.toMap(),
      'purpose': purpose?.toMap(),
      'smoking': smoking?.toMap(),
      'status': status?.toMap(),
      'work': work?.toMap(),
      'email': email,
      'phone': phone,
      'password': password,
      'fullname': fullname,
      'dob': dob?.toIso8601String(),
      'gender': gender,
      'finding': finding,
      'distance': distance,
      'address': address,
      'school': school,
      'description': description,
      'height': height,
      'weight': weight,
      'zodiac': zodiac,
      'createTime': createTime?.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'online': online,
      'matchingsForSecondUserId': matchingsForSecondUserId
          ?.map((matching) => matching.toMap())
          .toList(),
      'reportsForReportedId':
          reportsForReportedId?.map((report) => report.toMap()).toList(),
      'userConversations': userConversations
          ?.map((conversation) => conversation.toMap())
          .toList(),
      'userExercises':
          userExercises?.map((exercise) => exercise.toMap()).toList(),
      'videoCallsForReceiverId': videoCallsForReceiverId
          ?.map((videoCall) => videoCall.toMap())
          .toList(),
      'messages': messages?.map((message) => message.toMap()).toList(),
      'userHobbies': userHobbies?.map((hobby) => hobby.toMap()).toList(),
      'blocksForBlockedId':
          blocksForBlockedId?.map((block) => block.toMap()).toList(),
      'userImages': userImages?.map((image) => image.toMap()).toList(),
      'matchingsForFirstUserId':
          matchingsForFirstUserId?.map((matching) => matching.toMap()).toList(),
      'userLanguages':
          userLanguages?.map((language) => language.toMap()).toList(),
      'videoCallsForCallerId':
          videoCallsForCallerId?.map((videoCall) => videoCall.toMap()).toList(),
      'blocksForUseId': blocksForUseId?.map((block) => block.toMap()).toList(),
      'userExpectings':
          userExpectings?.map((expecting) => expecting.toMap()).toList(),
      'banneds': banneds?.map((banned) => banned.toMap()).toList(),
      'userPets': userPets?.map((pet) => pet.toMap()).toList(),
      'userSingers': userSingers?.map((singer) => singer.toMap()).toList(),
      'reportsForReporterId':
          reportsForReporterId?.map((report) => report.toMap()).toList(),
      'userMusics': userMusics?.map((music) => music.toMap()).toList(),
    };
  }

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     drinking: Drinking.fromJson(json['drinking']),
  //     family: Family.fromJson(json['family']),
  //     habit: Habit.fromJson(json['habit']),
  //     literacy: Literacy.fromJson(json['literacy']),
  //     purpose: Purpose.fromJson(json['purpose']),
  //     smoking: Smoking.fromJson(json['smoking']),
  //     status: Status.fromJson(json['status']),
  //     work: Work.fromJson(json['work']),
  //     email: json['email'],
  //     phone: json['phone'],
  //     password: json['password'],
  //     fullname: json['fullname'],
  //     dob: DateTime.parse(json['dob']),
  //     gender: json['gender'],
  //     finding: json['finding'],
  //     distance: json['distance'],
  //     address: json['address'],
  //     school: json['school'],
  //     description: json['description'],
  //     height: json['height'],
  //     weight: json['weight'],
  //     zodiac: json['zodiac'],
  //     createTime: DateTime.parse(json['createTime']),
  //     lastLogin: DateTime.parse(json['lastLogin']),
  //     online: json['online'],
  //     matchingsForSecondUserId: (json['matchingsForSecondUserId'] as List<dynamic>?)
  //         ?.map((matchingJson) => Matching.fromJson(matchingJson))
  //         .toSet(),
  //     reportsForReportedId: (json['reportsForReportedId'] as List<dynamic>?)
  //         ?.map((reportJson) => Report.fromJson(reportJson))
  //         .toSet(),
  //     userConversations: (json['userConversations'] as List<dynamic>?)
  //         ?.map((conversationJson) => UserConversation.fromJson(conversationJson))
  //         .toSet(),
  //     userExercises: (json['userExercises'] as List<dynamic>?)
  //         ?.map((exerciseJson) => UserExercise.fromJson(exerciseJson))
  //         .toSet(),
  //     videoCallsForReceiverId: (json['videoCallsForReceiverId'] as List<dynamic>?)
  //         ?.map((videoCallJson) => VideoCall.fromJson(videoCallJson))
  //         .toSet(),
  //     messages: (json['messages'] as List<dynamic>?)
  //         ?.map((messageJson) => Message.fromJson(messageJson))
  //         .toSet(),
  //     userHobbies: (json['userHobbies'] as List<dynamic>?)
  //         ?.map((hobbyJson) => UserHobby.fromJson(hobbyJson))
  //         .toSet(),
  //     blocksForBlockedId: (json['blocksForBlockedId'] as List<dynamic>?)
  //         ?.map((blockJson) => Block.fromJson(blockJson))
  //         .toSet(),
  //     userImages: (json['userImages'] as List<dynamic>?)
  //         ?.map((imageJson) => UserImage.fromJson(imageJson))
  //         .toSet(),
  //     matchingsForFirstUserId: (json['matchingsForFirstUserId'] as List<dynamic>?)
  //         ?.map((matchingJson) => Matching.fromJson(matchingJson))
  //         .toSet(),
  //     userLanguages: (json['userLanguages'] as List<dynamic>?)
  //         ?.map((languageJson) => UserLanguage.fromJson(languageJson))
  //         .toSet(),
  //     videoCallsForCallerId: (json['videoCallsForCallerId'] as List<dynamic>?)
  //         ?.map((videoCallJson) => VideoCall.fromJson(videoCallJson))
  //         .toSet(),
  //     blocksForUseId: (json['blocksForUseId'] as List<dynamic>?)
  //         ?.map((blockJson) => Block.fromJson(blockJson))
  //         .toSet(),
  //     userExpectings: (json['userExpectings'] as List<dynamic>?)
  //         ?.map((expectingJson) => UserExpecting.fromJson(expectingJson))
  //         .toSet(),
  //     banneds: (json['banneds'] as List<dynamic>?)
  //         ?.map((bannedJson) => Banned.fromJson(bannedJson))
  //         .toSet(),
  //     userPets: (json['userPets'] as List<dynamic>?)
  //         ?.map((petJson) => UserPet.fromJson(petJson))
  //         .toSet(),
  //     userSingers: (json['userSingers'] as List<dynamic>?)
  //         ?.map((singerJson) => UserSinger.fromJson(singerJson))
  //         .toSet(),
  //     reportsForReporterId: (json['reportsForReporterId'] as List<dynamic>?)
  //         ?.map((reportJson) => Report.fromJson(reportJson))
  //         .toSet(),
  //     userMusics: (json['userMusics'] as List<dynamic>?)
  //         ?.map((musicJson) => UserMusic.fromJson(musicJson))
  //         .toSet(),
  //   );
  // }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
//   factory User.fromJson(Map<String, dynamic> json) {
//   return User(
//     drinking: json['drinking'] != null ? Drinking.fromJson(json['drinking']) : null,
//     family: json['family'] != null ? Family.fromJson(json['family']) : null,
//     habit: json['habit'] != null ? Habit.fromJson(json['habit']) : null,
//     literacy: json['literacy'] != null ? Literacy.fromJson(json['literacy']) : null,
//     purpose: json['purpose'] != null ? Purpose.fromJson(json['purpose']) : null,
//     smoking: json['smoking'] != null ? Smoking.fromJson(json['smoking']) : null,
//     status: json['status'] != null ? Status.fromJson(json['status']) : null,
//     work: json['work'] != null ? Work.fromJson(json['work']) : null,
//     email: json['email'],
//     phone: json['phone'],
//     password: json['password'],
//     fullname: json['fullname'],
//     dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
//     gender: json['gender'],
//     finding: json['finding'],
//     address: json['address'],
//     school: json['school'],
//     description: json['description'],
//      id: json['id'] is int ? json['id'] : (json['id'] is String ? int.parse(json['id']) : null),
//     distance: json['distance'] is int ? json['distance'] : (json['distance'] is String ? int.parse(json['distance']) : null),
//     height: json['height'] is int ? json['height'] : (json['height'] is String ? int.parse(json['height']) : null),
//     weight: json['weight'] is int ? json['weight'] : (json['weight'] is String ? int.parse(json['weight']) : null),
//     createTime: json['createTime'] != null ? DateTime.parse(json['createTime']) : null,
//     lastLogin: json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
//     online: json['online'] is bool ? json['online'] : bool.fromEnvironment(json['online'].toString()),
//     matchingsForSecondUserId: (json['matchingsForSecondUserId'] as List<dynamic>?)
//         ?.map((matchingJson) => Matching.fromJson(matchingJson))
//         .toSet(),
//     reportsForReportedId: (json['reportsForReportedId'] as List<dynamic>?)
//         ?.map((reportJson) => Report.fromJson(reportJson))
//         .toSet(),
//     userConversations: (json['userConversations'] as List<dynamic>?)
//         ?.map((conversationJson) => UserConversation.fromJson(conversationJson))
//         .toSet(),
//     userExercises: (json['userExercises'] as List<dynamic>?)
//         ?.map((exerciseJson) => UserExercise.fromJson(exerciseJson))
//         .toSet(),
//     videoCallsForReceiverId: (json['videoCallsForReceiverId'] as List<dynamic>?)
//         ?.map((videoCallJson) => VideoCall.fromJson(videoCallJson))
//         .toSet(),
//     messages: (json['messages'] as List<dynamic>?)
//         ?.map((messageJson) => Message.fromJson(messageJson))
//         .toSet(),
//     userHobbies: (json['userHobbies'] as List<dynamic>?)
//         ?.map((hobbyJson) => UserHobby.fromJson(hobbyJson))
//         .toSet(),
//     blocksForBlockedId: (json['blocksForBlockedId'] as List<dynamic>?)
//         ?.map((blockJson) => Block.fromJson(blockJson))
//         .toSet(),
//     userImages: (json['userImages'] as List<dynamic>?)
//         ?.map((imageJson) => UserImage.fromJson(imageJson))
//         .toSet(),
//     matchingsForFirstUserId: (json['matchingsForFirstUserId'] as List<dynamic>?)
//         ?.map((matchingJson) => Matching.fromJson(matchingJson))
//         .toSet(),
//     userLanguages: (json['userLanguages'] as List<dynamic>?)
//         ?.map((languageJson) => UserLanguage.fromJson(languageJson))
//         .toSet(),
//     videoCallsForCallerId: (json['videoCallsForCallerId'] as List<dynamic>?)
//         ?.map((videoCallJson) => VideoCall.fromJson(videoCallJson))
//         .toSet(),
//     blocksForUseId: (json['blocksForUseId'] as List<dynamic>?)
//         ?.map((blockJson) => Block.fromJson(blockJson))
//         .toSet(),
//     userExpectings: (json['userExpectings'] as List<dynamic>?)
//         ?.map((expectingJson) => UserExpecting.fromJson(expectingJson))
//         .toSet(),
//     banneds: (json['banneds'] as List<dynamic>?)
//         ?.map((bannedJson) => Banned.fromJson(bannedJson))
//         .toSet(),
//     userPets: (json['userPets'] as List<dynamic>?)
//         ?.map((petJson) => UserPet.fromJson(petJson))
//         .toSet(),
//     userSingers: (json['userSingers'] as List<dynamic>?)
//         ?.map((singerJson) => UserSinger.fromJson(singerJson))
//         .toSet(),
//     reportsForReporterId: (json['reportsForReporterId'] as List<dynamic>?)
//         ?.map((reportJson) => Report.fromJson(reportJson))
//         .toSet(),
//     userMusics: (json['userMusics'] as List<dynamic>?)
//         ?.map((musicJson) => UserMusic.fromJson(musicJson))
//         .toSet(),
//   );
// }
}

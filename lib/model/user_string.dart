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
import 'package:json_annotation/json_annotation.dart';
part 'user_string.g.dart';

@JsonSerializable(explicitToJson: true)
class UserString {
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
  DateTime? createTime;
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

  UserString({
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
      'reportsForReportedId': reportsForReportedId
          ?.map((report) => report.toMap())
          .toList(),
      'userConversations': userConversations
          ?.map((conversation) => conversation.toMap())
          .toList(),
      'userExercises': userExercises
          ?.map((exercise) => exercise.toMap())
          .toList(),
      'videoCallsForReceiverId': videoCallsForReceiverId
          ?.map((videoCall) => videoCall.toMap())
          .toList(),
      'messages': messages?.map((message) => message.toMap()).toList(),
      'userHobbies': userHobbies?.map((hobby) => hobby.toMap()).toList(),
      'blocksForBlockedId': blocksForBlockedId
          ?.map((block) => block.toMap())
          .toList(),
      'userImages': userImages?.map((image) => image.toMap()).toList(),
      'matchingsForFirstUserId': matchingsForFirstUserId
          ?.map((matching) => matching.toMap())
          .toList(),
      'userLanguages': userLanguages?.map((language) => language.toMap()).toList(),
      'videoCallsForCallerId': videoCallsForCallerId
          ?.map((videoCall) => videoCall.toMap())
          .toList(),
      'blocksForUseId': blocksForUseId?.map((block) => block.toMap()).toList(),
      'userExpectings': userExpectings?.map((expecting) => expecting.toMap()).toList(),
      'banneds': banneds?.map((banned) => banned.toMap()).toList(),
      'userPets': userPets?.map((pet) => pet.toMap()).toList(),
      'userSingers': userSingers?.map((singer) => singer.toMap()).toList(),
      'reportsForReporterId': reportsForReporterId
          ?.map((report) => report.toMap())
          .toList(),
      'userMusics': userMusics?.map((music) => music.toMap()).toList(),
    };
  }
  factory UserString.fromJson(Map<String, dynamic> json) => _$UserStringFromJson(json);


//   factory UserString.fromJson(Map<String, dynamic> json) {
//   return switch (json) {
//        {
//       'id': int id,
//       'drinking': dynamic drinking,
//       'family': dynamic family,
//       'habit': dynamic habit,
//       'literacy': dynamic literacy,
//       'purpose': dynamic purpose,
//       'smoking': dynamic smoking,
//       'status': dynamic status,
//       'work': dynamic work,
//       'email': String email,
//       'phone': String phone,
//       'password': String password,
//       'fullname': String fullname,
//       'dob': String dob,
//       'gender': String gender,
//       'finding': String finding,
//       'address': String address,
//       'school': String school,
//       'description': String description,
//       'distance': int distance,
//       'height': int height,
//       'weight': int weight,
//       'zodiac': String zodiac,
//       'createTime': String createTime,
//       'lastLogin': String lastLogin,
//       'online': bool online,
//       'matchingsForSecondUserId': List<dynamic> matchingsForSecondUserId,
//       'reportsForReportedId': List<dynamic> reportsForReportedId,
//       'userConversations': List<dynamic> userConversations,
//       'userExercises': List<dynamic> userExercises,
//       'videoCallsForReceiverId': List<dynamic> videoCallsForReceiverId,
//       'messages': List<dynamic> messages,
//       'userHobbies': List<dynamic> userHobbies,
//       'blocksForBlockedId': List<dynamic> blocksForBlockedId,
//       'userImages': List<dynamic> userImages,
//       'matchingsForFirstUserId': List<dynamic> matchingsForFirstUserId,
//       'userLanguages': List<dynamic> userLanguages,
//       'videoCallsForCallerId': List<dynamic> videoCallsForCallerId,
//       'blocksForUseId': List<dynamic> blocksForUseId,
//       'userExpectings': List<dynamic> userExpectings,
//       'banneds': List<dynamic> banneds,
//       'userPets': List<dynamic> userPets,
//       'userSingers': List<dynamic> userSingers,
//       'reportsForReporterId': List<dynamic> reportsForReporterId,
//       'userMusics': List<dynamic> userMusics,
//     } =>
//       UserString(
//         id: id,
//         drinking: drinking != null ? Drinking.fromJson(drinking) : null,
//         family: family != null ? Family.fromJson(family) : null,
//         habit: habit != null ? Habit.fromJson(habit) : null,
//         literacy: literacy != null ? Literacy.fromJson(literacy) : null,
//         purpose: purpose != null ? Purpose.fromJson(purpose) : null,
//         smoking: smoking != null ? Smoking.fromJson(smoking) : null,
//         status: status != null ? Status.fromJson(status) : null,
//         work: work != null ? Work.fromJson(work) : null,
//         email: email,
//         phone: phone,
//         password: password,
//         fullname: fullname,
//         dob: dob != null ? DateTime.parse(dob) : null,
//         gender: gender,
//         finding: finding,
//         address: address,
//         school: school,
//         description: description,
//         distance: distance,
//         height: height,
//         weight: weight,
//         zodiac: zodiac,
//         createTime: createTime != null ? DateTime.parse(createTime) : null,
//         lastLogin: lastLogin != null ? DateTime.parse(lastLogin) : null,
//         online: online,
//         matchingsForSecondUserId: (matchingsForSecondUserId as List<dynamic>?)
//             ?.map((matchingJson) => Matching.fromJson(matchingJson))
//             .toSet(),
//         reportsForReportedId: (reportsForReportedId as List<dynamic>?)
//             ?.map((reportJson) => Report.fromJson(reportJson))
//             .toSet(),
//         userConversations: (userConversations as List<dynamic>?)
//             ?.map((conversationJson) => UserConversation.fromJson(conversationJson))
//             .toSet(),
//         userExercises: (userExercises as List<dynamic>?)
//             ?.map((exerciseJson) => UserExercise.fromJson(exerciseJson))
//             .toSet(),
//         videoCallsForReceiverId: (videoCallsForReceiverId as List<dynamic>?)
//             ?.map((videoCallJson) => VideoCall.fromJson(videoCallJson))
//             .toSet(),
//         messages: (messages as List<dynamic>?)
//             ?.map((messageJson) => Message.fromJson(messageJson))
//             .toSet(),
//         userHobbies: (userHobbies as List<dynamic>?)
//             ?.map((hobbyJson) => UserHobby.fromJson(hobbyJson))
//             .toSet(),
//         blocksForBlockedId: (blocksForBlockedId as List<dynamic>?)
//             ?.map((blockJson) => Block.fromJson(blockJson))
//             .toSet(),
//         userImages: (userImages as List<dynamic>?)
//             ?.map((imageJson) => UserImage.fromJson(imageJson))
//             .toSet(),
//         matchingsForFirstUserId: (matchingsForFirstUserId as List<dynamic>?)
//             ?.map((matchingJson) => Matching.fromJson(matchingJson))
//             .toSet(),
//         userLanguages: (userLanguages as List<dynamic>?)
//             ?.map((languageJson) => UserLanguage.fromJson(languageJson))
//             .toSet(),
//         videoCallsForCallerId: (videoCallsForCallerId as List<dynamic>?)
//             ?.map((videoCallJson) => VideoCall.fromJson(videoCallJson))
//             .toSet(),
//         blocksForUseId: (blocksForUseId as List<dynamic>?)
//             ?.map((blockJson) => Block.fromJson(blockJson))
//             .toSet(),
//         userExpectings: (userExpectings as List<dynamic>?)
//             ?.map((expectingJson) => UserExpecting.fromJson(expectingJson))
//             .toSet(),
//         banneds: (banneds as List<dynamic>?)
//             ?.map((bannedJson) => Banned.fromJson(bannedJson))
//             .toSet(),
//         userPets: (userPets as List<dynamic>?)
//             ?.map((petJson) => UserPet.fromJson(petJson))
//             .toSet(),
//         userSingers: (userSingers as List<dynamic>?)
//             ?.map((singerJson) => UserSinger.fromJson(singerJson))
//             .toSet(),
//         reportsForReporterId: (reportsForReporterId as List<dynamic>?)
//             ?.map((reportJson) => Report.fromJson(reportJson))
//             .toSet(),
//         userMusics: (userMusics as List<dynamic>?)
//             ?.map((musicJson) => UserMusic.fromJson(musicJson))
//             .toSet(),
//       ),
//     _ =>
// throw FormatException('Failed to load User. Invalid JSON format: $json'),
//   };
// }



}

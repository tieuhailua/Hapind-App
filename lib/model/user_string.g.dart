// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_string.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserString _$UserStringFromJson(Map<String, dynamic> json) => UserString(
      id: json['id'] as int?,
      drinking: json['drinking'] == null
          ? null
          : Drinking.fromJson(json['drinking'] as Map<String, dynamic>),
      family: json['family'] == null
          ? null
          : Family.fromJson(json['family'] as Map<String, dynamic>),
      habit: json['habit'] == null
          ? null
          : Habit.fromJson(json['habit'] as Map<String, dynamic>),
      literacy: json['literacy'] == null
          ? null
          : Literacy.fromJson(json['literacy'] as Map<String, dynamic>),
      purpose: json['purpose'] == null
          ? null
          : Purpose.fromJson(json['purpose'] as Map<String, dynamic>),
      smoking: json['smoking'] == null
          ? null
          : Smoking.fromJson(json['smoking'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      work: json['work'] == null
          ? null
          : Work.fromJson(json['work'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      fullname: json['fullname'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      finding: json['finding'] as String?,
      distance: json['distance'] as int?,
      address: json['address'] as String?,
      school: json['school'] as String?,
      description: json['description'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      zodiac: json['zodiac'] as String?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      online: json['online'] as bool?,
      matchingsForSecondUserId:
          (json['matchingsForSecondUserId'] as List<dynamic>?)
              ?.map((e) => Matching.fromJson(e as Map<String, dynamic>))
              .toSet(),
      reportsForReportedId: (json['reportsForReportedId'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userConversations: (json['userConversations'] as List<dynamic>?)
          ?.map((e) => UserConversation.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userExercises: (json['userExercises'] as List<dynamic>?)
          ?.map((e) => UserExercise.fromJson(e as Map<String, dynamic>))
          .toSet(),
      videoCallsForReceiverId:
          (json['videoCallsForReceiverId'] as List<dynamic>?)
              ?.map((e) => VideoCall.fromJson(e as Map<String, dynamic>))
              .toSet(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userHobbies: (json['userHobbies'] as List<dynamic>?)
          ?.map((e) => UserHobby.fromJson(e as Map<String, dynamic>))
          .toSet(),
      blocksForBlockedId: (json['blocksForBlockedId'] as List<dynamic>?)
          ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userImages: (json['userImages'] as List<dynamic>?)
          ?.map((e) => UserImage.fromJson(e as Map<String, dynamic>))
          .toSet(),
      matchingsForFirstUserId:
          (json['matchingsForFirstUserId'] as List<dynamic>?)
              ?.map((e) => Matching.fromJson(e as Map<String, dynamic>))
              .toSet(),
      userLanguages: (json['userLanguages'] as List<dynamic>?)
          ?.map((e) => UserLanguage.fromJson(e as Map<String, dynamic>))
          .toSet(),
      videoCallsForCallerId: (json['videoCallsForCallerId'] as List<dynamic>?)
          ?.map((e) => VideoCall.fromJson(e as Map<String, dynamic>))
          .toSet(),
      blocksForUseId: (json['blocksForUseId'] as List<dynamic>?)
          ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userExpectings: (json['userExpectings'] as List<dynamic>?)
          ?.map((e) => UserExpecting.fromJson(e as Map<String, dynamic>))
          .toSet(),
      banneds: (json['banneds'] as List<dynamic>?)
          ?.map((e) => Banned.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userPets: (json['userPets'] as List<dynamic>?)
          ?.map((e) => UserPet.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userSingers: (json['userSingers'] as List<dynamic>?)
          ?.map((e) => UserSinger.fromJson(e as Map<String, dynamic>))
          .toSet(),
      reportsForReporterId: (json['reportsForReporterId'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toSet(),
      userMusics: (json['userMusics'] as List<dynamic>?)
          ?.map((e) => UserMusic.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$UserStringToJson(UserString instance) =>
    <String, dynamic>{
      'id': instance.id,
      'drinking': instance.drinking?.toJson(),
      'family': instance.family?.toJson(),
      'habit': instance.habit?.toJson(),
      'literacy': instance.literacy?.toJson(),
      'purpose': instance.purpose?.toJson(),
      'smoking': instance.smoking?.toJson(),
      'status': instance.status?.toJson(),
      'work': instance.work?.toJson(),
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'fullname': instance.fullname,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'finding': instance.finding,
      'distance': instance.distance,
      'address': instance.address,
      'school': instance.school,
      'description': instance.description,
      'height': instance.height,
      'weight': instance.weight,
      'zodiac': instance.zodiac,
      'createTime': instance.createTime?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'online': instance.online,
      'matchingsForSecondUserId':
          instance.matchingsForSecondUserId?.map((e) => e.toJson()).toList(),
      'reportsForReportedId':
          instance.reportsForReportedId?.map((e) => e.toJson()).toList(),
      'userConversations':
          instance.userConversations?.map((e) => e.toJson()).toList(),
      'userExercises': instance.userExercises?.map((e) => e.toJson()).toList(),
      'videoCallsForReceiverId':
          instance.videoCallsForReceiverId?.map((e) => e.toJson()).toList(),
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'userHobbies': instance.userHobbies?.map((e) => e.toJson()).toList(),
      'blocksForBlockedId':
          instance.blocksForBlockedId?.map((e) => e.toJson()).toList(),
      'userImages': instance.userImages?.map((e) => e.toJson()).toList(),
      'matchingsForFirstUserId':
          instance.matchingsForFirstUserId?.map((e) => e.toJson()).toList(),
      'userLanguages': instance.userLanguages?.map((e) => e.toJson()).toList(),
      'videoCallsForCallerId':
          instance.videoCallsForCallerId?.map((e) => e.toJson()).toList(),
      'blocksForUseId':
          instance.blocksForUseId?.map((e) => e.toJson()).toList(),
      'userExpectings':
          instance.userExpectings?.map((e) => e.toJson()).toList(),
      'banneds': instance.banneds?.map((e) => e.toJson()).toList(),
      'userPets': instance.userPets?.map((e) => e.toJson()).toList(),
      'userSingers': instance.userSingers?.map((e) => e.toJson()).toList(),
      'reportsForReporterId':
          instance.reportsForReporterId?.map((e) => e.toJson()).toList(),
      'userMusics': instance.userMusics?.map((e) => e.toJson()).toList(),
    };

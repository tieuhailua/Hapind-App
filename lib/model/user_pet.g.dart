// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPet _$UserPetFromJson(Map<String, dynamic> json) => UserPet(
      id: json['id'] as int?,
      pet: json['pet'] == null
          ? null
          : Pet.fromJson(json['pet'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      choose: json['choose'] as bool?,
    );

Map<String, dynamic> _$UserPetToJson(UserPet instance) => <String, dynamic>{
      'id': instance.id,
      'pet': instance.pet?.toJson(),
      'user': instance.user?.toJson(),
      'choose': instance.choose,
    };

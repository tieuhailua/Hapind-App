// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userPets: (json['userPets'] as List<dynamic>?)
          ?.map((e) => UserPet.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userPets': instance.userPets?.map((e) => e.toJson()).toList(),
    };

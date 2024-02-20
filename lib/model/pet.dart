import 'package:hapind/model/user_pet.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pet.g.dart';

@JsonSerializable(explicitToJson: true)
class Pet {
  int? id;
  String? name;
  Set<UserPet>? userPets;

  Pet({
    this.id,
    this.name,
    this.userPets,
  });

  // Pet.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'],
  //       userPets = (json['userPets'] as List<dynamic>?)
  //           ?.map((userPetJson) => UserPet.fromJson(userPetJson))
  //           ?.toSet();
  factory Pet.fromJson(Map<String, dynamic> json)=> _$PetFromJson(json);

 Map<String, dynamic> toJson() => _$PetToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userPets': userPets?.map((userPet) => userPet.toMap())?.toList(),
    };
  }
}

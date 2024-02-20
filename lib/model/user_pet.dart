import 'package:hapind/model/pet.dart';
import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_pet.g.dart';

@JsonSerializable(explicitToJson: true)
class UserPet {
  int? id;
  Pet? pet;
  User? user;
  bool? choose;

  UserPet({
    this.id,
    this.pet,
    this.user,
    this.choose,
  });

  // UserPet.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       pet = Pet.fromJson(json['pet']),
  //       user = User.fromJson(json['user']),
  //       choose = json['choose'];
 factory UserPet.fromJson(Map<String, dynamic> json)=> _$UserPetFromJson(json);

 Map<String, dynamic> toJson() => _$UserPetToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pet': pet?.toMap(),
      'user': user?.toMap(),
      'choose': choose,
    };
  }
}

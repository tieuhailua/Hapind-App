import 'package:hapind/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_image.g.dart';

@JsonSerializable(explicitToJson: true)
class UserImage {
  int? id;
  User? user;
  String? imagePath;

  UserImage({
    this.id,
    this.user,
    this.imagePath,
  });

  // UserImage.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       user = User.fromJson(json['user']),
  //       imagePath = json['imagePath'];
  
factory UserImage.fromJson(Map<String, dynamic> json)=> _$UserImageFromJson(json);

 Map<String, dynamic> toJson() => _$UserImageToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user?.toMap(),
      'imagePath': imagePath,
    };
  }

  Future<String?> getImagePath() async {
    // Assuming imagePath is the field that contains the image path
    // You may need to adjust this based on your actual JSON structure
    return imagePath;
  }
}

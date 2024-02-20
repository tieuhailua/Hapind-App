import 'package:hapind/model/banned.dart';
import 'package:hapind/model/blog.dart';
import 'package:json_annotation/json_annotation.dart';
part 'admin.g.dart';


@JsonSerializable(explicitToJson: true)
class Admin {
  int? id;
  String? username;
  String? password;
  String? role;
  Set<Banned>? banneds;
  Set<Blog>? blogs;

  Admin({
    this.id,
    this.username,
    this.password,
    this.role,
    this.banneds,
    this.blogs,
  });

  // Admin.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       username = json['username'],
  //       password = json['password'],
  //       role = json['role'],
  //       banneds = (json['banneds'] as List<dynamic>?)
  //           ?.map((bannedJson) => Banned.fromJson(bannedJson))
  //           ?.toSet(),
  //       blogs = (json['blogs'] as List<dynamic>?)
  //           ?.map((blogJson) => Blog.fromJson(blogJson))
  //           ?.toSet();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'role': role,
      'banneds': banneds?.map((banned) => banned.toMap())?.toList(),
      'blogs': blogs?.map((blog) => blog.toMap())?.toList(),
    };
  }

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);


  Map<String, dynamic> toJson() => _$AdminToJson(this);
}

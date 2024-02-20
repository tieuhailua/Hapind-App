import 'package:hapind/model/blog.dart';
import 'package:json_annotation/json_annotation.dart';
part 'blog_image.g.dart';

@JsonSerializable(explicitToJson: true)
class BlogImage {
  int? id;
  Blog? blog;
  String? imagePath;

  BlogImage({
    this.id,
    this.blog,
    this.imagePath,
  });

  // BlogImage.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       blog = Blog.fromJson(json['blog']),
  //       imagePath = json['imagePath'];
  factory BlogImage.fromJson(Map<String, dynamic> json) => _$BlogImageFromJson(json);


  Map<String, dynamic> toJson() => _$BlogImageToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'blog': blog?.toMap(),
      'imagePath': imagePath,
    };
  }
}

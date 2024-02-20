import 'package:hapind/model/admin.dart';
import 'package:hapind/model/blog_image.dart';
import 'package:hapind/service/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'blog.g.dart';

@JsonSerializable(explicitToJson: true)
class Blog {
  int? id;
  Admin? admin;
  String? title;
  String? brief;
  String? content;
  @TimestampConverter()
  DateTime? publishDate;
  String? status;
  Set<BlogImage>? blogImages;

  Blog({
    this.id,
    this.admin,
    this.title,
    this.brief,
    this.content,
    this.publishDate,
    this.status,
    this.blogImages,
  });

  // Blog.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       admin = Admin.fromJson(json['admin']),
  //       title = json['title'],
  //       brief = json['brief'],
  //       content = json['content'],
  //       publishDate = DateTime.parse(json['publishDate']),
  //       status = json['status'],
  //       blogImages = (json['blogImages'] as List<dynamic>?)
  //           ?.map((blogImageJson) => BlogImage.fromJson(blogImageJson))
  //           ?.toSet();
  
factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

 Map<String, dynamic> toJson() => _$BlogToJson(this);
 
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'admin': admin?.toMap(),
      'title': title,
      'brief': brief,
      'content': content,
      'publishDate': publishDate?.toIso8601String(),
      'status': status,
      'blogImages': blogImages?.map((blogImage) => blogImage.toMap())?.toList(),
    };
  }
}

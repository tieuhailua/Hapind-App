import 'package:flutter/material.dart';
import 'package:hapind/model/blog.dart';
import 'package:hapind/screens/blog/components/blog_detail.dart';
import 'package:hapind/screens/blog/components/blog_menu.dart';
import 'package:hapind/screens/report_list/components/report_menu.dart';
import 'package:hapind/screens/terms/components/Consensus.dart';
import 'package:hapind/screens/terms/components/Should.dart';
import 'package:hapind/screens/terms/components/Terms_menu.dart';
import 'package:hapind/screens/terms/components/hapind.dart';
import 'package:hapind/screens/terms/components/information.dart';
import 'package:hapind/screens/terms/components/instructions.dart';
import 'package:hapind/screens/terms/components/quizApp.dart';
import 'package:hapind/screens/terms/components/report.dart';
import 'package:hapind/screens/terms/components/treatment.dart';
import 'package:hapind/service/user_service.dart';

class BlogInstrucstions extends StatefulWidget {
  static String routeName = "/blog";

  const BlogInstrucstions({super.key});

  @override
  State<BlogInstrucstions> createState() => _BlogInstrucstionsState();
}

class _BlogInstrucstionsState extends State<BlogInstrucstions> {
  UserService _userService = UserService();
  List<Blog>? blogs;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      blogs = await _userService.getBlog();
      // Ensure that the state is still mounted before calling setState
      if (mounted) {
        setState(() {
          // Update the UI with the retrieved blog data
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Blog",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          for (Blog blog
              in blogs ?? []) 
            BlogMenu(
              title: blog.title ?? "",
              brief: blog.brief ?? "",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogDetail(
                      content: blog.content ?? "",
                      title: blog.title ?? "",
                      publishedDate: blog.publishDate.toString() ??
                          "", // Replace with the actual date
                    ),
                  ),
                );
              },
            ),

          // BlogMenu(
          //     text: "Blog 2",
          //     press: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => Treatment()));
          //     }),
        ],
      ),
    );
  }
}

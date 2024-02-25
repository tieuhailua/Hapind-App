// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class BlogDetail extends StatelessWidget {
//   final String blogContent;
//   final String brief;
//   final String publishedDate;

//   const BlogDetail({
//     Key? key,
//     required this.blogContent,
//     required this.brief,
//     required this.publishedDate,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Blog Detail"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Published Date: $publishedDate",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Brief: $brief",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: WebViewWidget(
//               controller: WebViewPlatform.instance.createController(),
//               //initialUrl: '',
//               //javascriptMode: JavascriptMode.unrestricted,
//               //onWebViewCreated: (WebViewController webViewController) {
//                 webViewController.loadUrl(Uri.dataFromString(
//                   blogContent,
//                   mimeType: 'text/html',
//                   encoding: Encoding.getByName('utf-8'),
//                 ).toString());
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class BlogDetail extends StatefulWidget {
//   final String title,publishedDate,content;

//   const BlogDetail({
//     Key? key,
//     required this.title,
//     required this.publishedDate,
//     required this.content,
//   }) : super(key: key);
//   @override
//   State<BlogDetail> createState() => _BlogDetailState();
// }

// class _BlogDetailState extends State<BlogDetail> {
//   final controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.disabled)
//   //..loadRequest(Uri.parse("https://www.google.com/"));
//   //..loadHtmlString("""<h1><strong>abc</strong></h1><p><em>dasda</em></p><p><em style="color: rgb(230, 0, 0);">kdasd</em></p>""");
//   //..loadHtmlString(widget.content);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogDetail extends StatefulWidget {
  final String title, publishedDate, content;

  const BlogDetail({
    Key? key,
    required this.title,
    required this.publishedDate,
    required this.content,
  }) : super(key: key);

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  //late WebViewController controller;
  //final controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.disabled)
//   //..loadRequest(Uri.parse("https://www.google.com/"));
//   //..loadHtmlString("""<h1><strong>abc</strong></h1><p><em>dasda</em></p><p><em style="color: rgb(230, 0, 0);">kdasd</em></p>""");
//   //..loadHtmlString(widget.content);
  var controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      //..loadRequest(Uri.parse("https://www.google.com/"));
      //..loadHtmlString("""<h1><strong>abc</strong></h1><p><em>dasda</em></p><p><em style="color: rgb(230, 0, 0);">kdasd</em></p>""");
      ..loadHtmlString(widget.content);
    // controller = WebViewController(
    //   initialUrl: Uri.dataFromString(
    //     widget.content,
    //     mimeType: 'text/html',
    //     encoding: Encoding.getByName('utf-8'),
    //   ).toString(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Title: ${widget.title}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Published Date: ${widget.publishedDate}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Text(
              "Content:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: WebViewWidget(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}

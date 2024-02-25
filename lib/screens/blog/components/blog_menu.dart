import 'package:flutter/material.dart';

class BlogMenu extends StatelessWidget {
  const BlogMenu({
    Key? key,
    required this.title,
    required this.brief,
    this.press,
  }) : super(key: key);

  final String title, brief;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              brief,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // children: [
              //   // Add any other icons or elements you want here
              //   Icon(Icons.arrow_forward_ios),
              // ],
            ),
          ],
        ),
      ),
    );
  }
}

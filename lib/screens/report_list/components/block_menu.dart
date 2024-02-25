import 'package:flutter/material.dart';
import 'package:hapind/model/block.dart';

class BlockMenu extends StatelessWidget {
  const BlockMenu({
    Key? key,
    required this.blocks,
    this.press,
  }) : super(key: key);

  final List<Block> blocks;
  final VoidCallback? press;

 @override
  Widget build(BuildContext context) {
    if (blocks.isEmpty) {
      return Center(
        child: Text(
          'No Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }
    return ListView.builder(
      itemCount: blocks.length,
      itemBuilder: (context, index) {
        Block block = blocks[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
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
                  "Name: ${block.userByBlockedId?.fullname ?? ""}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                
              ],
            ),
          ),
        );
      },
    );
  }
}

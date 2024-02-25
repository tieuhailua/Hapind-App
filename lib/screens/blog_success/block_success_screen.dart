import 'package:flutter/material.dart';

import 'components/body.dart';

class BlockSuccessScreen extends StatelessWidget {
  static String routeName = "/block_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Block Success"),
      ),
      body: Body(),
    );
  }
}

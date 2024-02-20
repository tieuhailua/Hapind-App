import 'package:flutter/material.dart';
import 'package:hapind/screens/searchlove/components/love.dart';


//import 'components/body.dart';

class SearchLoveScreen extends StatelessWidget {
  SearchLoveScreen({required this.filter});
  static String routeName = "/searchlove";
  late final filter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MainPage(filter:filter),    
    );
  }
}

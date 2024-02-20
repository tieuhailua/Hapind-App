import 'package:flutter/material.dart';
import 'package:hapind/constants.dart';
import 'package:hapind/screens/distance/distance_screen.dart';
import 'package:hapind/screens/geo/geolocator_map.dart';
import 'package:hapind/screens/geo/geolocator_widget.dart';
import 'package:hapind/screens/home/home_screen.dart';
import 'package:hapind/screens/otp/otp_screen.dart';
import 'package:hapind/screens/purpose/purpose_screen.dart';
import 'package:hapind/screens/sign_in/sign_in_screen.dart';
import 'package:hapind/service/matching_service.dart';
import 'package:hapind/size_config.dart';

import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Hapind ",
      "image": "assets/images/splash.png"
    },
    {
      "text":
          "Welcome to Hapind",
      "image": "assets/images/splash9.png"
    },
    {
      "text": "Welcome to Hapind",
      "image": "assets/images/splash7.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        
        width: double.infinity,
        
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => AnimatedContainer(
                          duration: kAnimationDuration,
                          margin: EdgeInsets.only(right: 5),
                          height: 6,
                          width: currentPage == index ? 20 : 6,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? kPrimaryColor
                                : Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        // MatchingService _matchingService = MatchingService();
                        // _matchingService.getUserForMatching(Future.value("eyJhbGciOiJIUzUxMiJ9.eyJyb2xlcyI6InVzZXIiLCJzdWIiOiJ1c2VyMUBleGFtcGxlLmNvbSIsImF1ZCI6IlVzZXIgMSIsImlhdCI6MTcwNDk3NjQxMCwiZXhwIjoxNzA1MDYyODEwfQ.rTJtCfYh6IWPSLfCWNjui_fQyQMU7Zgk3zzaR1NpitkvpBGXBYoSdMgUzWip6dfKaARSY5mh3AFof62feEw48A"));
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

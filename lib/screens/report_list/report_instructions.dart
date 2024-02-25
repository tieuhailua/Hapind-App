import 'package:flutter/material.dart';
import 'package:hapind/model/block.dart';
import 'package:hapind/model/report.dart';
import 'package:hapind/screens/report_list/components/Terms_menu.dart';
import 'package:hapind/screens/report_list/components/block_menu.dart';
import 'package:hapind/screens/report_list/components/report_menu.dart';
import 'package:hapind/screens/terms/components/Consensus.dart';
import 'package:hapind/screens/terms/components/Should.dart';
import 'package:hapind/screens/terms/components/Terms_menu.dart';
import 'package:hapind/screens/terms/components/hapind.dart';
import 'package:hapind/screens/terms/components/information.dart';
import 'package:hapind/screens/terms/components/instructions.dart';
import 'package:hapind/screens/terms/components/quizApp.dart';
import 'package:hapind/screens/terms/components/treatment.dart';
import 'package:hapind/service/token_service.dart';
import 'package:hapind/service/user_service.dart';

class ReportInstrucstions extends StatefulWidget {
  static String routeName = "/report";

  const ReportInstrucstions({super.key});

  @override
  State<ReportInstrucstions> createState() => _ReportInstrucstionsState();
}

class _ReportInstrucstionsState extends State<ReportInstrucstions> {
  UserService _userService = UserService();
  TokenService _tokenService = TokenService();
  List<Block>? blocks;
  List<Report>? reports;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      blocks =
          await _userService.getBlock(await _tokenService.getStoredUserId());
      reports =
          await _userService.getReport(await _tokenService.getStoredUserId());
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
                  "Block & Report",
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
          BlockAndReportMenu(
              text: "Block User",
              icon: "assets/icons/User.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlockMenu(blocks: blocks! )));
              }),
          BlockAndReportMenu(
              text: "Report Record",
              icon: "assets/icons/thunder.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportMenu(reports: reports??List.empty()),
                  ),
                );
              }),
          // for (Block block in blocks ?? [])
          //   BlockMenu(
          //       fullname: block.userByBlockedId?.fullname ?? "", press: () {}),
          // for (Report report in reports ?? [])
          //   ReportMenu(
          //       username: report.userByReportedId?.fullname ?? "",
          //       reason: report.reason?.name ?? "",
          //       dateReport: report.createdAt.toString(),
          //       status: report.status ?? "",
          //       press: () {
          //         // Navigator.push(context,
          //         //     MaterialPageRoute(builder: (context) => Treatment()));
          //       }),
        ],
      ),
    );
  }
}

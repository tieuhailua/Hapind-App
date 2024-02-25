// import 'package:flutter/material.dart';

// class ReportMenu extends StatelessWidget {
//   const ReportMenu({
//     Key? key,
//     required this.username,
//     required this.reason,
//     required this.status,
//     required this.dateReport,
//     this.press,
//   }) : super(key: key);

//   final String username, reason,status,dateReport;
//   final VoidCallback? press;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: TextButton(
//         style: TextButton.styleFrom(
//           foregroundColor: Colors.black,
//           padding: EdgeInsets.all(20),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           backgroundColor: Color(0xFFF5F6F9),
//         ),
//         onPressed: press,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "User: "+username,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Date Report: "+dateReport,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//             Text(
//               "Reason: "+reason,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//             Text(
//               "Status: "+status,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//             ),
//             // SizedBox(height: 10),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     // Add any other icons or elements you want here
//             //     Icon(Icons.arrow_forward_ios),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hapind/model/report.dart';

// class ReportMenu extends StatelessWidget {
//   const ReportMenu({
//     Key? key,
//     required this.reports, // Add reports parameter
//     this.press,
//   }) : super(key: key);

//   final List<Report> reports; // Add reports parameter
//   final VoidCallback? press;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: reports.length,
//       itemBuilder: (context, index) {
//         Report report = reports[index];
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: TextButton(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.white,
//               padding: EdgeInsets.all(20),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               backgroundColor: Color(0xFFF5F6F9),
//             ),
//             onPressed: press,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Name: ${report.userByReportedId?.fullname ?? ""}",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Date Report: ${report.createdAt.toString()}",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Text(
//                   "Reason: ${report.reason?.name ?? ""}",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Text(
//                   "Status: ${report.status ?? ""}",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hapind/model/report.dart';

class ReportMenu extends StatelessWidget {
  const ReportMenu({
    Key? key,
    required this.reports,
    this.press,
  }) : super(key: key);

  final List<Report> reports;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    if (reports.isEmpty) {
      // Display "No Info" at the center of the screen if the list is empty
      return Center(
        child: Text(
          'No Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    // Display the list of reports
    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (context, index) {
        Report report = reports[index];
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
                  "Name: ${report.userByReportedId?.fullname ?? "No Info"}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Date Report: ${report.createdAt?.toString() ?? "No Info"}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Reason: ${report.reason?.name ?? "No Info"}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Status: ${report.status ?? "No Info"}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


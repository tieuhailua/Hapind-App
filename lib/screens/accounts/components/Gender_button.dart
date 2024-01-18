import 'package:flutter/material.dart';
// ignore: unused_import
import "package:hapind/screens/accounts/Edit_account.dart";

enum Gender { male, female }

// ignore: must_be_immutable
class   GenderButton extends StatefulWidget {
  GenderButton({super.key, required this.callback, required this.folderName});
  Function(String, String) callback;

  final String folderName;
  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  String get folderName => "gender";
  late String _folderName = 'gender';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _folderName = widget.folderName;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet<void>(
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,

              // Your bottom sheet content here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                 
                  ListTile(
                      leading: Icon(Icons.male,
                          color: Color.fromARGB(255, 70, 135, 232)),
                      title: Text('Male'),
                      onTap: () {
                        setState(() {
                          _folderName =  "Male";
                        });
                        widget.callback("_gender", "Male");
                        Navigator.pop(context);
                      }
                      // Handle uploading photo

                      ),
                  ListTile(
                    leading: Icon(Icons.female,
                        color: Color.fromARGB(255, 198, 5, 5)),
                    title: Text('Female'),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15)),
                    onTap: ()
                        {
                           setState(() {
                          _folderName =  "Female";
                        });
                        widget.callback("_gender", "Female");
                        Navigator.pop(context);
                        },
                  ),

                  ElevatedButton(
                    child: const Text('Close'),
                    // style: style,
                    onPressed: () => Navigator.pop(context),
                  ),
                  // Add more options as needed
                ],
              ),
            );
          },
        );
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 238, 239, 239)),
          side: MaterialStateProperty.all<BorderSide>(
            // Đường viền của button
            BorderSide(
              color: const Color.fromARGB(255, 216, 214, 214),
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 235, 235),
            borderRadius: BorderRadius.circular(15)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
                height: 30,
              ),
              Text(
                _folderName,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 236, 82, 5)),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          )
        ]),
      ),
    );
    //  final ButtonStyle style =
    //       ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    // return GestureDetector(
    //   onTap: () {
    //     showModalBottomSheet<void>(
    //       isDismissible: false,
    //       enableDrag: false,
    //       context: context,
    //       builder: (BuildContext context) {
    //         return Container(
    //           height: 200,
    //           color: Color.fromARGB(255, 252, 253, 252),
    //           child: Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: <Widget>[
    //                 ListTile(
    //                     leading: Icon(Icons.male,
    //                         color: Color.fromARGB(255, 70, 135, 232)),
    //                     title: Text('Male'),
    //                     tileColor: Colors.blue,
    //                     iconColor: const Color.fromARGB(255, 219, 18, 18),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(15)),
    //                     onTap: () {}),
    //                 ListTile(
    //                     leading: Icon(Icons.female,
    //                         color: const Color.fromARGB(255, 245, 13, 13)),
    //                     title: Text('Female'),
    //                     tileColor: Colors.blue,
    //                     iconColor: const Color.fromARGB(255, 219, 18, 18),
    //                     onTap: () => _selectGender(context, "Female")),
    //                 ElevatedButton(
    //                   child: const Text('Close'),
    //                   // style: style,
    //                   onPressed: () => Navigator.pop(context),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //   },
    //   child: Container(
    //     margin: const EdgeInsets.only(bottom: 8),
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     height: 65,
    //     decoration: BoxDecoration(
    //         color: Color.fromARGB(255, 237, 235, 235),
    //         borderRadius: BorderRadius.circular(15)),
    //     child:
    //         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //       Row(
    //         children: [
    //           const SizedBox(
    //             width: 12,
    //           ),
    //           Text(
    //             folderName,
    //             style: const TextStyle(
    //                 fontSize: 16, color: Color.fromARGB(255, 236, 82, 5)),
    //           )
    //         ],
    //       ),
    //       IconButton(
    //         onPressed: () {
    //           //       showModalBottomSheet<void>(
    //           //   context: context,
    //           //   builder: (BuildContext context) {
    //           //     return Container(
    //           //       height: 200,
    //           //       color: const Color.fromARGB(255, 244, 243, 240),
    //           //       child: Center(
    //           //         child: Column(
    //           //           mainAxisAlignment: MainAxisAlignment.center,
    //           //           mainAxisSize: MainAxisSize.min,
    //           //           children: <Widget>[
    //           //             const Text('Modal BottomSheet'),
    //           //             ElevatedButton(
    //           //               child: const Text('Close BottomSheet'),
    //           //               onPressed: () => Navigator.pop(context),
    //           //             ),
    //           //           ],
    //           //         ),
    //           //       ),
    //           //     );
    //           //   },
    //           // );
    //         },
    //         icon: const Icon(
    //           Icons.keyboard_arrow_down,
    //           color: Colors.grey,
    //         ),
    //       )
    //     ]),
    //   ),
    // );
  }
}

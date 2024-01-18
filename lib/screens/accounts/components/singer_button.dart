import 'package:flutter/material.dart';
import 'package:hapind/models/chexbox.dart';
enum ExerciseFilter {
  HipHop,
  POp,
  Bolero,
  Javacom,
  lyduchao,
  buingocminh,
  buiminhtin,
  Tieuhailua
}


// ignore: must_be_immutable
class SingerButton extends StatefulWidget {
  SingerButton({
    super.key,
    required this.folderName,
  });
  final String folderName;

  @override
  State<SingerButton> createState() => _SingerButtonState();
  bool checkboxValue1 = false;
   
}

class _SingerButtonState extends State<SingerButton> {
  bool checkboxValue1 = false;
  bool showCheckbox = false;
  final String folderName = 'Singer';
  List<CheckBoxData> checkboxDataList = [
    new CheckBoxData(id: '1', displayId: 'minh tin', checked: false),
    new CheckBoxData(id: '2', displayId: 'tieu hai lua', checked: false),
    new CheckBoxData(id: '3', displayId: 'huu hao', checked: false),
    new CheckBoxData(id: '4', displayId: 'huu hao', checked: false),
    new CheckBoxData(id: '5', displayId: 'huu hao', checked: false),
    new CheckBoxData(id: '6', displayId: 'huu hao', checked: false),
  ];
  Set<ExerciseFilter> filters = <ExerciseFilter>{};
  
  @override
  Widget build(BuildContext context) {
     // ignore: unused_local_variable
     final TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: () {
         showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            // <-- SEE HERE
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (BuildContext context) {
            return Container(
              height: 250,
                width: 500,
              // Your bottom sheet content here
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Wrap(
                    spacing: 5.0,
                    children:
                        ExerciseFilter.values.map((ExerciseFilter exercise) {
                      return FilterChip(
                        label: Text(exercise.name),
                        selected: filters.contains(exercise),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              filters.add(exercise);
                            } else {
                              filters.remove(exercise);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                 
                  // Add more options as needed
                ],
              ),
            );
          },
        );
        // showModalBottomSheet<void>(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return StatefulBuilder(
        //       builder: (BuildContext context, StateSetter state) {
        //         return SingleChildScrollView(
        //           child: LimitedBox(
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               mainAxisSize: MainAxisSize.min,
        //               children: <Widget>[
        //                 Padding(
        //                   padding: const EdgeInsets.only(
        //                       top: 30.0, left: 10, bottom: 10),
        //                   child: Text(
        //                     'Singer',
        //                     style:
        //                         TextStyle(color: Colors.black54, fontSize: 18),
        //                   ),
        //                 ),
        //                    Wrap(
        //             spacing: 5.0,
        //             children:
        //                 ExerciseFilter.values.map((ExerciseFilter exercise) {
        //               return FilterChip(
        //                 label: Text(exercise.name),
        //                 selected: filters.contains(exercise),
        //                 onSelected: (bool selected) {
        //                   setState(() {
        //                     if (selected) {
        //                       filters.add(exercise);
        //                     } else {
        //                       filters.remove(exercise);
        //                     }
        //                   });
        //                 },
        //               );
        //             }).toList(),
        //           ),
        //            ElevatedButton(
        //             child: const Text('Close'),
        //             onPressed: () => Navigator.pop(context),
        //           ),
        //                 // style: style,

        //                 // ListView(
        //                 //   shrinkWrap: true,
        //                 //   children: checkboxDataList.map<Widget>(
        //                 //     (data) {
        //                 //       return Container(
        //                 //         child: CheckboxListTile(
        //                 //           value: data.checked,
        //                 //           title: Text(data.displayId),
        //                 //           shape: RoundedRectangleBorder(
        //                 //               borderRadius: BorderRadius.circular(15)),
        //                 //           controlAffinity:
        //                 //               ListTileControlAffinity.leading,
        //                 //           onChanged: (bool? val) {
        //                 //             state(() {
        //                 //               data.checked = !data.checked;
        //                 //             });
        //                 //           },
        //                 //         ),
        //                 //       );
        //                 //     },
        //                 //   ).toList(),
        //                 // ),

        //                 // ListView(
        //                 //   shrinkWrap: true,
        //                 //   children: checkboxDataList.map<Widget>(
        //                 //         (data) {
        //                 //       return Container(
        //                 //         child: CheckboxListTile(
        //                 //           value: data.checked,
        //                 //           title: Text(data.displayId),
        //                 //           controlAffinity: ListTileControlAffinity.leading,
        //                 //           onChanged: (bool? val) {
        //                 //             state(() {
        //                 //               data.checked = !data.checked;
        //                 //             });
        //                 //           },
        //                 //         ),
        //                 //       );
        //                 //     },
        //                 //   ).toList(),
        //                 // ),
        //               ],
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   },
        // );
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
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 235, 235),
            borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                folderName,
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
  }
}

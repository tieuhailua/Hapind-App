import 'package:flutter/material.dart';

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

enum FindingFilter { Male, Female, Everyone }

enum GenderFilter { Male, Female }

class OneToOne extends StatefulWidget {
  const OneToOne({Key? key, required this.folderName}) : super(key: key);

  final String folderName;

  @override
  State<OneToOne> createState() => _OneToOneButtonState(folderName: folderName);
}

class _OneToOneButtonState extends State<OneToOne> {
  String folderName;
  _OneToOneButtonState({required this.folderName});

  late Set<dynamic> filters;
  late Set<dynamic> selectedFilters = {};
  
  void createFilters() {
    switch (folderName) {
      case 'Finding':
        filters = FindingFilter.values.toSet();
        break;
      case 'Gender':
        filters = GenderFilter.values.toSet();
        break;
      default:
        filters = {};
    }
    selectedFilters = Set.from(filters);
  }

  @override
  void initState() {
    super.initState();
    createFilters();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final TextTheme textTheme = Theme.of(context).textTheme;
    //createFilters();

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
                    children: List<Widget>.generate(
                      filters.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text(filters
                              .elementAt(index)
                              .toString()
                              .split('.')[1]),
                          selected: selectedFilters
                              .contains(filters.elementAt(index)),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                selectedFilters
                                    .clear(); // Clear existing selection
                                selectedFilters.add(filters.elementAt(index));
                              } else {
                                selectedFilters
                                    .remove(filters.elementAt(index));
                              }
                              print(selectedFilters.first.toString().split('.')[1]);
                            });
                          },
                          // onSelected: (bool selected) {
                          //   setState(()  {
                          //     if (selected) {
                          //       selectedFilters =  {filters.elementAt(index)};

                          //     } else if (selectedFilters.length > 1) {
                          //        selectedFilters
                          //           .remove(filters.elementAt(index));
                          //     }
                          //     print(selectedFilters.first.toString()
                          //     .split('.')[1]);
                          //   });
                          // },
                        );
                      },
                    ).toList(),
                  ),

                  // Wrap(
                  //   spacing: 5.0,
                  //   children: filters.map((dynamic filter) {
                  //     return ChoiceChip(
                  //       label: Text(filter.toString().split('.')[1]),
                  //       selected: filters.contains(filter),
                  //       onSelected: (bool selected) {
                  //         setState(() {
                  //           if (selected) {
                  //             filters.add(filter);
                  //           } else {
                  //             filters.remove(filter);
                  //           }
                  //         });
                  //       },
                  //     );
                  //   }).toList(),
                  // ),
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

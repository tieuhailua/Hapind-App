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

class TestButton extends StatefulWidget {
  const TestButton({super.key, required this.folderName});
 final String folderName;

  @override
  State<TestButton> createState() => _TestButtonState();
  
}

class _TestButtonState extends State<TestButton> {
  Set<ExerciseFilter> filters = <ExerciseFilter>{};
  String folderName = 'Test1';
  

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

import 'package:flutter/material.dart';

class CusttomImagesContainer extends StatelessWidget {
  const CusttomImagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
    child: Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.5),
        border: Border(bottom: BorderSide(
          width: 1,
          color: Theme.of(context).primaryColor,
        ),
        top: BorderSide(
          width: 1,
          color: Theme.of(context).primaryColor,
        ),
        left: BorderSide(
          width: 1,
          color: Theme.of(context).primaryColor,
        ),

        )
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
      ),
    ),
    );
  }
}
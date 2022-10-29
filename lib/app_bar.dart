import 'package:flutter/material.dart';

class AppBarW extends StatelessWidget {
  final String sectionName;
  const AppBarW({
    Key? key,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/firebaselogo.png",
          height: 30,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "FLUTTER FIRE ",
          style: TextStyle(color: Colors.amberAccent),
        ),
        Text("$sectionName")
      ],
    );
  }
}

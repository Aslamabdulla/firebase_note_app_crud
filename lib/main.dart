import 'package:firebase_crud/login.dart';
import 'package:firebase_crud/my_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final FocusNode focusNode = FocusNode();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Crud Note',
        theme: ThemeData(
          fontFamily: 'Poppins',

          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHome());
  }
}

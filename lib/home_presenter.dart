import 'package:firebase_crud/add_screen.dart';
import 'package:firebase_crud/app_bar.dart';
import 'package:firebase_crud/validator/item_list.dart';
import 'package:flutter/material.dart';

const bgColor = Color(0XFF2c384A);

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2c384A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: AppBarW(sectionName: "NOTE APP"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddScreen(),
          ));
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ItemList(),
      )),
    );
  }
}

import 'package:firebase_crud/add_item_form.dart';
import 'package:firebase_crud/app_bar.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode desCriptionFocusNode = FocusNode();
  AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        titleFocusNode.unfocus();
        desCriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0XFF2c384A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: AppBarW(sectionName: "CRUD"),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: AddItemForm(
            titleFocusNode: titleFocusNode,
            desCriptionFocusNode: desCriptionFocusNode,
          ),
        )),
      ),
    );
  }
}

import 'package:firebase_crud/app_bar.dart';
import 'package:firebase_crud/home_presenter.dart';
import 'package:firebase_crud/validator/database.dart';
import 'package:firebase_crud/validator/edit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {required this.currentTitle,
      required this.currentDescription,
      required this.docId});
  final String currentTitle;
  final String currentDescription;
  final String docId;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

final FocusNode _titleFocusNode = FocusNode();
final FocusNode _descriptionFocusNode = FocusNode();
bool isDeleting = false;

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: AppBarW(sectionName: "EDIT"),
          actions: [
            isDeleting
                ? Padding(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 15, left: 15),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      setState(() {
                        isDeleting = true;
                      });
                      await Database.deleteItem(docId: widget.docId);
                      setState(() {
                        isDeleting = false;
                      });
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 35,
                    ))
          ],
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: EditItemScrenForm(
                  currentDocId: widget.docId,
                  currentTitle: widget.currentTitle,
                  titleFocusNode: _titleFocusNode,
                  descriptionFocusNode: _descriptionFocusNode,
                  currentDescription: widget.currentDescription,
                ))),
      ),
    );
  }
}

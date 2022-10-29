// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_crud/add_item_form.dart';
import 'package:firebase_crud/validator/custom_form_field.dart';
import 'package:firebase_crud/validator/database.dart';
import 'package:firebase_crud/validator/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditItemScrenForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;
  String currentTitle;
  String currentDescription;
  final String currentDocId;
  EditItemScrenForm({
    Key? key,
    required this.titleFocusNode,
    required this.descriptionFocusNode,
    required this.currentTitle,
    required this.currentDescription,
    required this.currentDocId,
  }) : super(key: key);

  @override
  State<EditItemScrenForm> createState() => _EditItemScrenFormState();
}

class _EditItemScrenFormState extends State<EditItemScrenForm> {
  final _addItemFormKey = GlobalKey<FormState>();
  bool isProcessing = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String updateTitle = "";
  String updateDescription = "";
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _addItemFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Title",
                      style: TextStyle(color: Color(0XFF2c384A), fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomFormField(
                        initial: widget.currentTitle,
                        isLabelEnabled: false,
                        controller: _titleController,
                        focusNode: widget.titleFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        label: "title",
                        hint: "Enter the title",
                        validator: (value) {
                          Validator.validateField(value: value);
                          setState(() {
                            widget.currentTitle = value;
                            updateTitle = widget.currentTitle;
                            updateTitle = _titleController.text;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                        initial: widget.currentDescription,
                        maxLines: 10,
                        isLabelEnabled: false,
                        controller: _descriptionController,
                        focusNode: widget.descriptionFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        label: "description",
                        hint: "Write Description",
                        validator: (value) {
                          Validator.validateField(value: value);
                          setState(() {
                            widget.currentDescription = value;

                            updateDescription = widget.currentDescription;
                            updateDescription = _descriptionController.text;
                          });
                        }),
                    isProcessing
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.orangeAccent)),
                          )
                        : Container(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  print(widget.currentDocId);
                                  widget.titleFocusNode.unfocus();
                                  widget.descriptionFocusNode.unfocus();
                                  if (_addItemFormKey.currentState!
                                      .validate()) {
                                    setState(() {
                                      isProcessing = true;
                                    });
                                    await Database.updateItem(
                                        docId: widget.currentDocId,
                                        title: updateTitle,
                                        description: updateDescription);
                                    setState(() {
                                      isProcessing = false;
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("EDIT ITEM")),
                          )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

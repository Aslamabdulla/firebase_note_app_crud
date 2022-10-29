import 'package:firebase_crud/validator/custom_form_field.dart';
import 'package:firebase_crud/validator/database.dart';
import 'package:firebase_crud/validator/validators.dart';
import 'package:flutter/material.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode desCriptionFocusNode;
  const AddItemForm(
      {super.key,
      required this.titleFocusNode,
      required this.desCriptionFocusNode});

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();
  bool isProcessing = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String getTitle = "";
  String getDescription = "";
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
                        isLabelEnabled: false,
                        controller: _titleController,
                        focusNode: widget.titleFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        label: "title",
                        hint: "Enter the title",
                        validator: (value) {
                          Validator.validateField(value: value);
                          getTitle = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                        maxLines: 10,
                        isLabelEnabled: false,
                        controller: _descriptionController,
                        focusNode: widget.desCriptionFocusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        label: "description",
                        hint: "Write Description",
                        validator: (value) {
                          Validator.validateField(value: value);
                          getDescription = value;
                        }),
                    isProcessing
                        ? Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.orangeAccent)),
                          )
                        : Container(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  widget.titleFocusNode.unfocus();
                                  widget.desCriptionFocusNode.unfocus();
                                  if (_addItemFormKey.currentState!
                                      .validate()) {
                                    setState(() {
                                      isProcessing = true;
                                    });
                                    await Database.addItem(
                                        title: getTitle,
                                        description: getDescription);
                                    setState(() {
                                      isProcessing = false;
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("ADD ITEM")),
                          )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

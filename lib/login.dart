// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_crud/validator/custom_form_field.dart';
import 'package:firebase_crud/validator/database.dart';
import 'package:firebase_crud/home_presenter.dart';
import 'package:firebase_crud/validator/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginFormScreen extends StatefulWidget {
  final FocusNode focusNode;
  const LoginFormScreen({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _uidController = TextEditingController();
    final _loginInFormKey = GlobalKey<FormState>();
    String getId = "";
    return Form(
        key: _loginInFormKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24),
              child: Column(
                children: [
                  CustomFormField(
                      controller: _uidController,
                      focusNode: widget.focusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      label: "UNIQUE USER Id",
                      hint: "USERNAME",
                      validator: (value) {
                        Validator.validateField(value: value);
                        getId = value;
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.focusNode.unfocus();
                    if (_loginInFormKey.currentState!.validate()) {
                      Database.userId = getId;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeWidget(),
                      ));
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            )
          ],
        ));
  }
}

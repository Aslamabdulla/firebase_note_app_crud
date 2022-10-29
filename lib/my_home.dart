import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/login.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final FocusNode _uidFocusNode = FocusNode();
  Future<FirebaseApp> intializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.cyanAccent,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Image.asset("assets/firebaselogo.png")),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "FLUTTER FIRE",
                        style: TextStyle(
                            backgroundColor: Colors.blueAccent, fontSize: 40),
                      )
                    ],
                  )),
                  FutureBuilder(
                    future: intializeFirebase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("ERROR INTIALIZING");
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return LoginFormScreen(focusNode: _uidFocusNode);
                      }
                      return CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

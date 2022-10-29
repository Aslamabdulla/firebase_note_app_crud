import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/home_presenter.dart';
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
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: Image.asset(
                            "assets/firebaselogo.png",
                            height: 150,
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "FLUTTER FIRE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: FutureBuilder(
                      future: intializeFirebase(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text("ERROR INTIALIZING");
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return LoginFormScreen(focusNode: _uidFocusNode);
                        }
                        return const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orangeAccent),
                        );
                      },
                    ),
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

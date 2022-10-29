import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/validator/database.dart';
import 'package:firebase_crud/validator/edit_screen.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Text("");
        }
        if (snapshot.hasError) {
          return Text('SOMETHING WENT WRONG');
        } else if (snapshot.hasData && snapshot != null) {
          return ListView.separated(
              itemBuilder: (context, index) {
                var noteInfo =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                String docId = snapshot.data!.docs[index].id;
                String title = noteInfo['title'];
                String description = noteInfo['description'];

                return Ink(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditScreen(
                          currentTitle: title,
                          currentDescription: description,
                          docId: docId),
                    )),
                    title: Text(
                      "NOTE: $title",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      "$description",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 16,
                  ),
              itemCount: snapshot.data!.docs.length);
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
          ),
        );
      },
    );
  }
}

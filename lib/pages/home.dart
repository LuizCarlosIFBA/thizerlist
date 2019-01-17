import 'package:flutter/material.dart';
import 'package:thizerlist/layout.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/HomeList.dart';

class HomePage extends StatelessWidget {

  static String tag = 'home-page';

  @override
  Widget build(BuildContext context){

    // final content = HomeList();

    var content = StreamBuilder(
      stream: Firestore.instance.collection('listas').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Text('Carregando...');
        }

        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (BuildContext context, i) {
            DocumentSnapshot document = snapshot.data.documents[i];

            return ListTile(
              leading: Icon(Icons.pages),
              title: Text(document['nome']),
              trailing: GestureDetector(
                onTap: () {

                  document.reference.updateData({
                    'nome': 'Mudou agora'
                  });

                  // Firestore.instance.runTransaction((transaction) async {
                  //   DocumentSnapshot freshDoc = await transaction.get(document.reference);
                  //   // await transaction.delete(freshDoc.reference);
                  //   await transaction.update(freshDoc.reference, {
                  //     'nome': 'Mudou agora'
                  //   });
                  // });
                },
                child: Icon(Icons.delete),
              ),
            );
          },
        );
      },
    );

    return Layout.getContent(context, content);
  }
}
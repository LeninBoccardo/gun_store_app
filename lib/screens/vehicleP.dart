import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:gun_store_app/model/vehicle.dart';

class VehicleScreen extends StatefulWidget {
  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final db = Firestore.instance;
  final String collection = "vehicle";

  List<Vehicle> list = List();

  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    listen?.cancel();

    listen = db.collection(collection).snapshots().listen((res) {
      setState(() {
        list = res.documents
            .map((doc) => Vehicle.fromMap(doc.data, doc.documentID))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seção de veículos"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey[800],
        child: StreamBuilder<QuerySnapshot>(
            stream: db.collection(collection).snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());

                default:
                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            list[index].name,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text('R\$' + list[index].price,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              )),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _deletar(context, docs[index], index);
                              }),
                          onTap: () {
                            Navigator.pushNamed(context, "/vRegister", arguments: list[index].id);
                          },
                        );
                      });
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/vRegister");
        },
      ),
      backgroundColor: Colors.brown[50],
    );
  }

  //deletar item
  void _deletar(BuildContext context, DocumentSnapshot doc, int position) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Tem certeza que deseja excluir?"),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Sim"),
            onPressed: () {
              db.collection(collection).document(doc.documentID).delete();
              setState(() {
                list.removeAt(position);
              });
              Navigator.pop(context);
            },
          ),
          BasicDialogAction(
            title: Text("Não"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

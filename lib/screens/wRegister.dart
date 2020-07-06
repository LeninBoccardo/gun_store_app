import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gun_store_app/model/weapon.dart';

class WeaponRegisterScreen extends StatefulWidget {
  @override
  _WeaponRegisterScreenState createState() => _WeaponRegisterScreenState();
}

class _WeaponRegisterScreenState extends State<WeaponRegisterScreen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtType = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  var db = Firestore.instance;

  void getDocumento(String idDocumento) async {
    DocumentSnapshot doc =
      await db.collection("weapon").document(idDocumento).get();

    setState(() {
      txtName.text = doc.data["name"];
      txtPrice.text = doc.data["price"];
      txtType.text = doc.data["type"];
      txtDescription.text = doc.data["description"];
    });
  }

  @override
  Widget build(BuildContext context) {

    final String idDocumento = (ModalRoute.of(context).settings.arguments);

    if (idDocumento != null) {
      if(txtName.text == "" && txtPrice.text == "" && txtType.text == "" && txtDescription.text == ""){
        getDocumento(idDocumento);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de armas"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextField(
              controller: txtName,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: txtPrice,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Preço",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: txtType,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Tipo",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: txtDescription,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.black,
                  child: Text("Salvar", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    if(idDocumento == null){
                      inserir(context, Weapon(idDocumento, txtName.text, 
                      txtPrice.text, txtType.text, txtDescription.text));
                    }else{
                      atualizar(context, Weapon(idDocumento, txtName.text, 
                      txtPrice.text, txtType.text, txtDescription.text));
                    }
                  },
                ),
                SizedBox(width: 20,),
                RaisedButton(
                  color: Colors.black,
                  child: Text("Cancelar", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
            ),
            ),
        ),
      ),
    );
  }

  void atualizar(BuildContext context, Weapon weapon) async{
    await db.collection("weapon").document(weapon.id).updateData({
        "name": weapon.name,
        "price": weapon.price,
        "type": weapon.type, 
        "description": weapon.description, 
      }
    );
    Navigator.pop(context);
  }

  void inserir(BuildContext context, Weapon weapon) async{
    await db.collection("weapon").add({
        "name": weapon.name,
        "price": weapon.price,
        "type": weapon.type,
        "description": weapon.description,
      }
    );
    Navigator.pop(context);
  }
}
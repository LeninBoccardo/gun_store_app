import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gun_store_app/model/accessory.dart';

class AccessoryRegisterScreen extends StatefulWidget {
  @override
  _AccessoryRegisterScreenState createState() => _AccessoryRegisterScreenState();
}

class _AccessoryRegisterScreenState extends State<AccessoryRegisterScreen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();

  var db = Firestore.instance;

  void getDocumento(String idDocumento) async {
    DocumentSnapshot doc =
      await db.collection("accessory").document(idDocumento).get();

    setState(() {
      txtName.text = doc.data["name"];
      txtPrice.text = doc.data["price"];
    });
  }

  @override
  Widget build(BuildContext context) {

    final String idDocumento = (ModalRoute.of(context).settings.arguments);

    if (idDocumento != null) {
      if(txtName.text == "" && txtPrice.text == ""){
        getDocumento(idDocumento);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de acessórios"),
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
                      inserir(context, Accessory(idDocumento, txtName.text, txtPrice.text));
                    }else{
                      atualizar(context, Accessory(idDocumento, txtName.text, txtPrice.text));
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

  void atualizar(BuildContext context, Accessory accessory) async{
    await db.collection("accessory").document(accessory.id).updateData({
        "name": accessory.name,
        "price": accessory.price,
      }
    );
    Navigator.pop(context);
  }

  void inserir(BuildContext context, Accessory accessory) async{
    await db.collection("accessory").add({
        "name": accessory.name,
        "price": accessory.price,
      }
    );
    Navigator.pop(context);
  }
}
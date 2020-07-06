import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gun_store_app/model/vehicle.dart';

class VehicleRegisterScreen extends StatefulWidget {
  @override
  _VehicleRegisterScreenState createState() => _VehicleRegisterScreenState();
}

class _VehicleRegisterScreenState extends State<VehicleRegisterScreen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtFunction = TextEditingController();

  var db = Firestore.instance;

  void getDocumento(String idDocumento) async {
    DocumentSnapshot doc =
      await db.collection("vehicle").document(idDocumento).get();

    setState(() {
      txtName.text = doc.data["name"];
      txtPrice.text = doc.data["price"];
      txtFunction.text = doc.data["function"];
    });
  }

  @override
  Widget build(BuildContext context) {

    final String idDocumento = (ModalRoute.of(context).settings.arguments);

    if (idDocumento != null) {
      if(txtName.text == "" && txtPrice.text == "" && txtFunction.text == ""){
        getDocumento(idDocumento);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de veículos"),
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
              controller: txtFunction,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Função",
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
                      inserir(context, Vehicle(idDocumento, txtName.text, txtPrice.text, txtFunction.text));
                    }else{
                      atualizar(context, Vehicle(idDocumento, txtName.text, txtPrice.text, txtFunction.text));
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

  void atualizar(BuildContext context, Vehicle vehicle) async{
    await db.collection("vehicle").document(vehicle.id).updateData({
        "name": vehicle.name,
        "price": vehicle.price,
        "function": vehicle.function,
      }
    );
    Navigator.pop(context);
  }

  void inserir(BuildContext context, Vehicle vehicle) async{
    await db.collection("vehicle").add({
        "name": vehicle.name,
        "price": vehicle.price,
        "function": vehicle.function
      }
    );
    Navigator.pop(context);
  }

}
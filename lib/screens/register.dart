//
//UNUSED CLASS FOR A WHILE
//

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gun_store_app/model/accessory.dart';
import 'package:gun_store_app/model/vehicle.dart';
import 'package:gun_store_app/model/weapon.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtFunction = TextEditingController();
  TextEditingController txtType = TextEditingController();

  var db = Firestore.instance;

  void getDocument(String idDocument, String collection) async {
  
    DocumentSnapshot doc = await db.collection(collection).document(idDocument).get();

    if(collection == 'weapon'){
      setState(() {
        txtName.text = doc.data["name"];
        txtPrice.text = doc.data["price"];
        txtType.text = doc.data["type"];
        txtDescription.text = doc.data["description"];
      });
    }else if(collection == 'vehicle'){
      setState(() {
        txtName.text = doc.data["name"];
        txtPrice.text = doc.data["price"];
        txtType.text = doc.data["type"];
        txtDescription.text = doc.data["description"];
      });
    }else if(collection == 'acessory'){
      setState(() {
        txtName.text = doc.data["name"];
        txtPrice.text = doc.data["price"];
        txtType.text = doc.data["type"];
        txtDescription.text = doc.data["description"];
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    final Map data = ModalRoute.of(context).settings.arguments;

    final String id = data['idDocument'].toString();
    final String collection = data['collection'].toString();

    print(data);
    print(id);
    print(collection);

    if (id != null){
      if(txtName.text == "" && txtPrice.text == "" && txtType.text == "" && txtDescription.text == "" && txtFunction.text == ""){
        getDocument(id, collection);
      }
    }
    
    Scaffold weapon(){
      return Scaffold(
      appBar: AppBar(
        title: Text("Gun Store"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Text(
                "Cadastro de Armas",//collectionName,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(height: 20,),
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
                      if(id == null){
                        inserir(
                          context,
                          collection, 
                          weapon: Weapon(
                            id, 
                            txtName.text, 
                            txtPrice.text, 
                            txtType.text, 
                            txtDescription.text
                          )
                        );
                      }else{
                        atualizar(
                          context,
                          collection, 
                          weapon: Weapon(
                            id, 
                            txtName.text, 
                            txtPrice.text, 
                            txtType.text, 
                            txtDescription.text
                          )
                        );
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
    ); 
  }

    Scaffold vehicle(){
      return Scaffold(
      appBar: AppBar(
        title: Text("Gun Store"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Text(
                "Cadastro de Veículos",//collectionName,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(height: 20,),
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
                controller: txtDescription,
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
                      if(id == null){
                        inserir(
                          context,
                          collection, 
                          vehicle: Vehicle(
                            id, 
                            txtName.text, 
                            txtPrice.text, 
                            txtFunction.text
                          )
                        );
                      }else{
                        atualizar(
                          context,
                          collection, 
                          vehicle: Vehicle(
                            id, 
                            txtName.text, 
                            txtPrice.text,
                            txtFunction.text
                          )
                        );
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
    ); 
    }

    Scaffold accessory(){
      return Scaffold(
      appBar: AppBar(
        title: Text("Gun Store"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Text(
                "Cadastro de Acessórios",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(height: 20,),
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
                      if(id == null){
                        inserir(
                          context,
                          collection, 
                          accessory: Accessory(
                            id, 
                            txtName.text, 
                            txtPrice.text,
                          )
                        );
                      }else{
                        atualizar(
                          context,
                          collection, 
                          accessory: Accessory(
                            id, 
                            txtName.text, 
                            txtPrice.text,
                          )
                        );
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
    ); 
    }

    if (id == null) {
      return weapon();
    } else if (collection == 'vehicle') {
      return vehicle();
    } else if (collection == 'accessory') {
      return accessory();
    }
  }

  void atualizar(BuildContext context, String collectionName, {Weapon weapon, Vehicle vehicle, Accessory accessory}) async{
    if (collectionName == 'weapon') {
      await db.collection(collectionName).document(weapon.id).updateData({
        "name": weapon.name,
        "price": weapon.price,
        "type": weapon.type,
        "description": weapon.description, 
      });
    } else if (collectionName == 'vehicle') {
      await db.collection(collectionName).document(weapon.id).updateData({
        "name": vehicle.name,
        "price": vehicle.price,
        "function": vehicle.function, 
      });
    } else if (collectionName == 'accessory') {
      await db.collection(collectionName).document(weapon.id).updateData({
        "name": accessory.name,
        "price": accessory.price,
      });
    }
    Navigator.pop(context);
  }

  void inserir(BuildContext context, String collectionName, {Weapon weapon, Vehicle vehicle, Accessory accessory}) async{
    if (collectionName == null) {
      await db.collection('weapon').add({
        "name": weapon.name,
        "price": weapon.price,
        "type": weapon.type,
        "description": weapon.description, 
      });
    } else if (collectionName == 'vehicle') {
      await db.collection(collectionName).add({
        "name": vehicle.name,
        "price": vehicle.price,
        "function": vehicle.function, 
      });
    } else if (collectionName == 'accessory') {
      await db.collection(collectionName).add({
        "name": accessory.name,
        "price": accessory.price,
      });
    }
    Navigator.pop(context);
  }

}
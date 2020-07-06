import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Produtos"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                'Categorias',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/weapon');
                },
                child: Text('Armas'),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/vehicle');
                },
                child: Text('Veículos'),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/accessory');
                },
                child: Text('Acessórios'),
              ),
            ],
          ),
        ),
      ),
    );  
  }
}

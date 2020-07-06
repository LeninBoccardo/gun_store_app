import 'package:flutter/material.dart';
import 'package:gun_store_app/authentication/auth.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Menu"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Sair"),
              onTap: () {
                _auth.signOut();
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // Navigate back to first screen when tapped.
                Navigator.pushNamed(context, '/info');
              },
              child: Text('Informações'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/product');
              },
              child: Text('Produtos'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Meus pedidos'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Carrinho'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/numbers");
              },
              child: Text('Números'),
            )
          ],
        ),
      ),
    );
  }
}
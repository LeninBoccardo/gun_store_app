import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Informações'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('assets/logo.jpg'),
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(height: 20.0),
                Card(
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.grey[800],
                    ),
                    title: Text(
                      'Sobre a loja',
                      style: TextStyle(color: Colors.grey[800], fontSize: 20),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/about'),
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.grey[800],
                    ),
                    title: Text(
                      'Desenvolvedor',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[800],
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/developer'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
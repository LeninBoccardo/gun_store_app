import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Desenvolvedor'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: AssetImage('assets/me.jpg'),
                ),
                SizedBox(height: 30),
                Text(
                  'Lenin Boccardo de Andrade\n',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  'Código: 827969\n',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  'Tema: Loja de Armas\n',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  'Objetivo do projeto: ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  'O objetivo desse projeto visa criar um aplicativo de uma loja fictícia de armas, ' +
                      'no qual o usuario é capaz de logar em uma conta, procurar e comprar itens de seu interesse.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[300],
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
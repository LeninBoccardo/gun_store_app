import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sobre a loja'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Loja especializada em venda de armas, veículos e equipamentos militares.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0
                ),
              ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Text('Desde 2020 nossa loja tem oferecido aos clientes o melhor do que se pode encontrar no mundo das armas. ' +
              'Somos escpecialista no seguimento, possuindo mais de mil funcionários fictícios que realizam compra, venda, suporte e até produção ' +
              'de equipamentos próprios.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
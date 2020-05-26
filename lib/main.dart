import 'package:flutter/material.dart';

void main() => runApp(GunStoreApp());

class GunStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/info': (context) => InfoScreen(),
        '/products': (context) => ProductScreen(),
        '/developer': (context) => Developer(),
        '/about': (context) => About(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/logo.jpg'),
                ),
                SizedBox(
                  height: 50,
                ),
                LoginValidation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginValidation extends StatefulWidget {
  @override
  LoginValidationState createState() {
    return LoginValidationState();
  }
}

class LoginValidationState extends State<LoginValidation> {
  final _loginKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  String empty_field = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Text(
                  'Usuário:',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            TextFormField(
              initialValue: empty_field,
              style: TextStyle(color: Colors.white),
              validator: (value) {
                if (value != 'lenin') {
                  return 'Usuário não encontrado';
                }
                return null;
              },
            ),
            Form(
              key: _passwordKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      Text(
                        'Senha:',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    validator: (value2) {
                      if (value2 != '1234') {
                        return 'Senha incorreta';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Entrar'),
              onPressed: () {
                if (_loginKey.currentState.validate() &&
                    _passwordKey.currentState.validate()) {
                  Navigator.pushNamed(context, '/main');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Menu"),
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
                Navigator.pushNamed(context, '/products');
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
              onPressed: () {},
              child: Text('Tutoriais'),
            )
          ],
        ),
      ),
    );
  }
}

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

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //final String name;
  //final String price;
  //final String photo;

  //WeaponWidget(this.name, this.price, this.photo): super();

  Container catalogShow(String name) {
    return Container(
      height: 100,
      color: Colors.grey[300],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(name),
              FlatButton(
                child: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Produto indisponível no momento.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                child: Text(
                  'Categorias',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.black),
              ),
              ListTile(
                title: Text('Tudo'),
              ),
              ListTile(
                title: Text('Armas'),
              ),
              ListTile(
                title: Text('Equipamentos'),
              ),
              ListTile(
                title: Text('Veículos'),
              ),
              ListTile(
                title: Text("Voltar"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Produtos'),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              catalogShow('Magnum .44'),
              catalogShow('SR-556'),
              catalogShow('AK-47'),
            ],
          ),
        ),
      ),
    );
  }
}

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

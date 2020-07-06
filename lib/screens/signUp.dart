import 'package:flutter/material.dart';
import 'package:gun_store_app/authentication/auth.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final AuthService _auth = AuthService();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  String empty_field = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                  key: _emailKey,
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
                              'Email:',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        TextFormField(
                          initialValue: empty_field,
                          style: TextStyle(color: Colors.white),
                          validator: (value) =>
                              value.isEmpty ? 'Digite um email válido' : null,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
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
                                validator: (value) => value.length < 8
                                    ? 'Senha deve conter 8 ou mais caracteres'
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          child: Text('Registrar'),
                          onPressed: () async {
                            if (_emailKey.currentState.validate() &&
                                _passwordKey.currentState.validate()) {
                              dynamic result =
                                  await _auth.register(email, password);
                              if (result == null) {
                                setState(() {
                                  error = "Insira um email ou senha válidos";
                                });
                              } else {
                                setState(() {
                                  error = '';
                                });
                                showPlatformDialog(
                                  context: context,
                                  builder: (_) => BasicDialogAlert(
                                    title:
                                        Text("Usuário cadastrado com sucesso! Presione ok para entrar."),
                                    actions: <Widget>[
                                      BasicDialogAction(
                                        title: Text("Ok"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, "/main");
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:gun_store_app/authentication/auth.dart';

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
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String empty_field = '';
  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  'Usuário:',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            TextFormField(
              initialValue: empty_field,
              style: TextStyle(color: Colors.white),
              validator: (value) => value.isEmpty ? 'Digite um email válido' : null,
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
                    validator: (value) => value.length < 8 ? 'Senha deve conter 8 ou mais caracteres' : null,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0,),
            Text(
              error,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('Entrar'),
                  onPressed: () async {
                    if (_emailKey.currentState.validate() && _passwordKey.currentState.validate()) {
                      dynamic result = await _auth.signIn(email, password);
                      if(result == null){
                        setState(() {
                          error = 'Usuário não encontrado';
                        });
                      }else{
                        setState(() {
                          error = '';
                        });
                        Navigator.pushNamed(context, '/main');
                      }
                    }
                  },
                ),
                RaisedButton(
                  child: Text('Registrar'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/singUp');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

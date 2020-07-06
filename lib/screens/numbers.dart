import 'package:flutter/material.dart';
import 'package:gun_store_app/api/model/numbers.dart';

class NumbersScreen extends StatefulWidget {
  @override
  _NumbersScreenState createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {

  String numberTxt = 'Loading';

  void setNumber() async {
    Numbers instance = Numbers(url: 'random?json');
    await instance.getNumber();
    setState(() {
      numberTxt = instance.text;
    });
  }

  void setYear() async {
    Numbers instance = Numbers(url: 'random/year?json');
    await instance.getNumber();
    setState(() {
      numberTxt = instance.text;
    });
  }

  @override
  void initState() {
    super.initState();
    setNumber();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Números'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey[800],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.black,
                        child: Text(
                          'Novo número',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0
                          ),
                        ),
                        onPressed: () {
                          setNumber();
                        },
                      ),
                      RaisedButton(
                        color: Colors.black,
                        child: Text(
                          'Novo ano',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0
                          ),
                        ),
                        onPressed: () {
                          setYear();
                        },
                      ),
                    ],
                  ),
                  Text(
                    numberTxt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
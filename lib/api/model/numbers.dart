import 'dart:convert';
import 'package:http/http.dart';


class Numbers{
  String url;
  String text;
  bool found;
  int number;
  String type;

  Numbers({this.url, this.text,this.found, this.number, this.type});

  Future<void> getNumber() async {
    try {
      Response response = await get('http://numbersapi.com/$url');
      Map data = jsonDecode(response.body);
      text = data['text'];
    } catch (e) {
      print('caught error: $e');
      text = 'Não foi possível recuperar os dados';
    }
    
  }

}

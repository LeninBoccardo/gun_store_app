
class Vehicle{
  String _id;
  String _name;
  String _price;
  String _function;

  Vehicle(this._id, this._name, this._price, this._function);

  String get id => _id;
  String get name => _name;
  String get price => _price;
  String get function => _function;

  Vehicle.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._price = obj['price'];
    this._function = obj['function'];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_id != null){
      map["id"] = _id;
    }
    map["name"] = _name;
    map["price"] = _price;
    map["function"] = _function;
    return map;
  }

  Vehicle.fromMap(Map<String, dynamic> map, String id){
    this._id = id ?? '';
    this._name = map["name"];
    this._price = map["price"];
    this._function = map["function"];
  }
}
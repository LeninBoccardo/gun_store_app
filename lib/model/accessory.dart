class Accessory{
  String _id;
  String _name;
  String _price;

  Accessory(this._id, this._name, this._price);

  String get id => _id;
  String get name => _name;
  String get price => _price;

  Accessory.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._price = obj['price'];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_id != null){
      map["id"] = _id;
    }
    map["name"] = _name;
    map["price"] = _price;
    return map;
  }

  Accessory.fromMap(Map<String, dynamic> map, String id){
    this._id = id ?? '';
    this._name = map["name"];
    this._price = map["price"];
  }
}
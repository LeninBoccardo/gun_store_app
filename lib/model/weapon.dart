class Weapon{
  String _id;
  String _name;
  String _price;
  String _type;
  String _description;

  Weapon(this._id, this._name, this._price, this._type, this._description);

  String get id => _id;
  String get name => _name;
  String get price => _price;
  String get type => _type;
  String get description => _description;

  Weapon.map(dynamic obj){
    this._id = obj['id'];
    this._name = obj['name'];
    this._price = obj['price'];
    this._type = obj['type'];
    this._description = obj['description'];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_id != null){
      map["id"] = _id;
    }
    map["name"] = _name;
    map["price"] = _price;
    map["type"] = _type;
    map["description"] = _description;
    return map;
  }

  Weapon.fromMap(Map<String, dynamic> map, String id){
    this._id = id ?? '';
    this._name = map["name"];
    this._price = map["price"];
    this._type = map["type"];
    this._description = map["description"];
  }
}
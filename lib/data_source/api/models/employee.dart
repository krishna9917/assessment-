import 'dart:convert';
/// id : 1
/// name : "Savion Durgan"
/// company : "Herman - Trantow"
/// username : "Charlotte_Christiansen"
/// email : "Triston.OHara73@yahoo.com"
/// address : "508 1st Street"
/// zip : "69893-0446"
/// state : "Michigan"
/// country : "Bangladesh"
/// phone : "873.263.6286"
/// photo : "https://json-server.dev/ai-profiles/24.png"

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));
String employeeToJson(Employee data) => json.encode(data.toJson());
class Employee {
  Employee({
      num? id, 
      String? name, 
      String? company, 
      String? username, 
      String? email, 
      String? address, 
      String? zip, 
      String? state, 
      String? country, 
      String? phone, 
      String? photo,}){
    _id = id;
    _name = name;
    _company = company;
    _username = username;
    _email = email;
    _address = address;
    _zip = zip;
    _state = state;
    _country = country;
    _phone = phone;
    _photo = photo;
}

  Employee.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _company = json['company'];
    _username = json['username'];
    _email = json['email'];
    _address = json['address'];
    _zip = json['zip'];
    _state = json['state'];
    _country = json['country'];
    _phone = json['phone'];
    _photo = json['photo'];
  }
  num? _id;
  String? _name;
  String? _company;
  String? _username;
  String? _email;
  String? _address;
  String? _zip;
  String? _state;
  String? _country;
  String? _phone;
  String? _photo;
Employee copyWith({  num? id,
  String? name,
  String? company,
  String? username,
  String? email,
  String? address,
  String? zip,
  String? state,
  String? country,
  String? phone,
  String? photo,
}) => Employee(  id: id ?? _id,
  name: name ?? _name,
  company: company ?? _company,
  username: username ?? _username,
  email: email ?? _email,
  address: address ?? _address,
  zip: zip ?? _zip,
  state: state ?? _state,
  country: country ?? _country,
  phone: phone ?? _phone,
  photo: photo ?? _photo,
);
  num? get id => _id;
  String? get name => _name;
  String? get company => _company;
  String? get username => _username;
  String? get email => _email;
  String? get address => _address;
  String? get zip => _zip;
  String? get state => _state;
  String? get country => _country;
  String? get phone => _phone;
  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['company'] = _company;
    map['username'] = _username;
    map['email'] = _email;
    map['address'] = _address;
    map['zip'] = _zip;
    map['state'] = _state;
    map['country'] = _country;
    map['phone'] = _phone;
    map['photo'] = _photo;
    return map;
  }

}
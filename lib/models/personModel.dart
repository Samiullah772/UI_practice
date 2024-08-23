/// _id : "66addd3f728c63f0682e3f07"
/// name : "\"SAMIULLAH\""
/// location : "\"Nowshera\""
/// department : "\"IT\""
/// joinDate : "2020-01-31T19:00:00.000Z"
/// __v : 0

class PersonModel {
  PersonModel({
      String? id, 
      String? name, 
      String? location, 
      String? department, 
      String? joinDate, 
      num? v,}){
    _id = id;
    _name = name;
    _location = location;
    _department = department;
    _joinDate = joinDate;
    _v = v;
}

  PersonModel.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _location = json['location'];
    _department = json['department'];
    _joinDate = json['joinDate'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  String? _location;
  String? _department;
  String? _joinDate;
  num? _v;
PersonModel copyWith({  String? id,
  String? name,
  String? location,
  String? department,
  String? joinDate,
  num? v,
}) => PersonModel(  id: id ?? _id,
  name: name ?? _name,
  location: location ?? _location,
  department: department ?? _department,
  joinDate: joinDate ?? _joinDate,
  v: v ?? _v,
);
  String? get id => _id;
  String? get name => _name;
  String? get location => _location;
  String? get department => _department;
  String? get joinDate => _joinDate;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['location'] = _location;
    map['department'] = _department;
    map['joinDate'] = _joinDate;
    map['__v'] = _v;
    return map;
  }

}
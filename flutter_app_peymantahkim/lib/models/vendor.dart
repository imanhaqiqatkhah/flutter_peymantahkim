import 'dart:convert';

class Vendor {
  // define fields
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;

  Vendor({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.locality,
    required this.password,
  });

  // serialization: convert user object to a map
  // map: a map is collection of key-value pairs
  // why: converting to a map is a intermediate step that makes it easier to serialize
  // the object to formats like json for storage or transmission.

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "state": state,
      "city": city,
      "locality": locality,
      "password": password,
    };
  }

  // serialization: convert map to a json string
  //this method directly encodes the data from the map into a json string

  // the json.encode() function converts a dart object (such as map or list)
  // into a json string representation, making it suitable for communication
  //between different systems.
  String toJson() => json.encode(toMap());

  // deserialization: convert a map to a user object
  // purpose - manipulation and user: once the data is converted to a user object
  // it can be easily manipulated and use within the application. for example
  // we might want to display the user's fullName, email etc on the Ui or we might
  // want to save the data locally.

  // the factory constructor takes a map(usually obtained from json object)
  /// and converts it into a user object. if field is not present in the ,
  /// it defaults to an empty string.

  // fromMap: this constructor take a map<string, dynamic> and convert into a user object.
  // it useful when you already have the data in map format
  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      id: map['_id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
    );
  }

  // fromJson: this factory constructor takes json string, and decodes into a map<string, dynamic>
  // and then uses fromMap to convert that map into a User object

  factory Vendor.fromJson(String source) =>
      Vendor.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

class User {
  final String name;
  final String phone;
  final String address;
  final String postalcode;
  final image;
  final double lat;
  final double lng;

  User({
    required this.name,
    required this.address,
    required this.image,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.postalcode,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'phone': phone,
      'address': address,
      'name': name,
      'postal_code': postalcode,
      'lat': lat,
      'lng': lng,
    };
  }

  factory User.fromJson(String? jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString!);

    return User(
        name: map['name'],
        address: map['address'],
        image: map['image'],
        lat: map['lat'],
        lng: map['lng'],
        phone: map['phone'],
        postalcode: map['postal_code']);
  }
}

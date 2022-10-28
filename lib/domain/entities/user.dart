
import 'address.dart';
import 'company.dart';
import 'dart:convert' as util;

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  factory User.fromMap(Map<String, dynamic> json) {

    return User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"],
      address : null,
      company: Company.fromMap(util.json.decode(json["company"])),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": util.jsonEncode(address?.toMap()),
        "phone": phone,
        "website": website,
        "company": util.jsonEncode(company?.toMap())
      };
}
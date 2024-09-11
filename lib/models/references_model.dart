// To parse this JSON data, do
//
//     final references = referencesFromJson(jsonString);

import 'dart:convert';

List<References> referencesFromJson(String str) => List<References>.from(json.decode(str).map((x) => References.fromJson(x)));

String referencesToJson(List<References> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class References {
    final String linkedin;
    final String name;
    final String phone;
    final String position;

    References({
        required this.linkedin,
        required this.name,
        required this.phone,
        required this.position,
    });

    factory References.fromJson(Map<String, dynamic> json) => References(
        linkedin: json["linkedin"],
        name: json["name"],
        phone: json["phone"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "linkedin": linkedin,
        "name": name,
        "phone": phone,
        "position": position,
    };
}

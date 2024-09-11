// To parse this JSON data, do
//
//     final experience = experienceFromJson(jsonString);

import 'dart:convert';

List<Experience> experienceFromJson(String str) => List<Experience>.from(json.decode(str).map((x) => Experience.fromJson(x)));

String experienceToJson(List<Experience> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Experience {
    final String endYear;
    final String name;
    final String position;
    final String startYear;

    Experience({
        required this.endYear,
        required this.name,
        required this.position,
        required this.startYear,
    });

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        endYear: json["endYear"],
        name: json["name"],
        position: json["position"],
        startYear: json["startYear"],
    );

    Map<String, dynamic> toJson() => {
        "endYear": endYear,
        "name": name,
        "position": position,
        "startYear": startYear,
    };
}

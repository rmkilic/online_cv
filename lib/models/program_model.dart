// To parse this JSON data, do
//
//     final program = programFromJson(jsonString);

import 'dart:convert';

Program programFromJson(String str) => Program.fromJson(json.decode(str));

String programToJson(Program data) => json.encode(data.toJson());

class Program {
    final String? description;
    final String? features;
    final String? images;
    final int? index;
    final String? name;
    final String? platform;

    Program({
        this.description,
        this.features,
        this.images,
        this.index,
        this.name,
        this.platform,
    });

    factory Program.fromJson(Map<String, dynamic> json) => Program(
        description: json["description"] ?? "",
        features: json["features"]?? "",
        images: json["images"]?? "",
        index: json["index"],
        name: json["name"]?? "",
        platform: json["platform"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "features": features,
        "images": images,
        "index": index,
        "name": name,
        "platform": platform,
    };
}

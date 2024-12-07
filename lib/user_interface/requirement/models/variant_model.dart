// To parse this JSON data, do
//
//     final variantModel = variantModelFromJson(jsonString);

import 'dart:convert';

VariantModel variantModelFromJson(String str) =>
    VariantModel.fromJson(json.decode(str));

String variantModelToJson(VariantModel data) => json.encode(data.toJson());

class VariantModel {
  List<BodyType>? variants;
  List<BodyType>? fuelTypes;
  List<BodyType>? bodyTypes;
  List<BodyType>? transmissions;
  List<BodyType>? colors;

  VariantModel({
    this.variants,
    this.fuelTypes,
    this.bodyTypes,
    this.transmissions,
    this.colors,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) => VariantModel(
        variants: json["variants"] == null
            ? []
            : List<BodyType>.from(
                json["variants"]!.map((x) => BodyType.fromJson(x))),
        fuelTypes: json["fuelTypes"] == null
            ? []
            : List<BodyType>.from(
                json["fuelTypes"]!.map((x) => BodyType.fromJson(x))),
        bodyTypes: json["bodyTypes"] == null
            ? []
            : List<BodyType>.from(
                json["bodyTypes"]!.map((x) => BodyType.fromJson(x))),
        transmissions: json["transmissions"] == null
            ? []
            : List<BodyType>.from(
                json["transmissions"]!.map((x) => BodyType.fromJson(x))),
        colors: json["colors"] == null
            ? []
            : List<BodyType>.from(
                json["colors"]!.map((x) => BodyType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "fuelTypes": fuelTypes == null
            ? []
            : List<dynamic>.from(fuelTypes!.map((x) => x.toJson())),
        "bodyTypes": bodyTypes == null
            ? []
            : List<dynamic>.from(bodyTypes!.map((x) => x.toJson())),
        "transmissions": transmissions == null
            ? []
            : List<dynamic>.from(transmissions!.map((x) => x.toJson())),
        "colors": colors == null
            ? []
            : List<dynamic>.from(colors!.map((x) => x.toJson())),
      };
}

class BodyType {
  int? id;
  String? name;

  BodyType({
    this.id,
    this.name,
  });

  factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

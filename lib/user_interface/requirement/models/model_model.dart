// To parse this JSON data, do
//
//     final modelModel = modelModelFromJson(jsonString);

import 'dart:convert';

ModelModel modelModelFromJson(String str) =>
    ModelModel.fromJson(json.decode(str));

String modelModelToJson(ModelModel data) => json.encode(data.toJson());

class ModelModel {
  bool? status;
  List<Datum>? data;

  ModelModel({
    this.status,
    this.data,
  });

  factory ModelModel.fromJson(Map<String, dynamic> json) => ModelModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;

  Datum({
    this.id,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

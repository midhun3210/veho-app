// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

List<VehicleModel> vehicleModelFromJson(String str) => List<VehicleModel>.from(
    json.decode(str).map((x) => VehicleModel.fromJson(x)));

String vehicleModelToJson(List<VehicleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleModel {
  int? id;
  String? uniqueId;
  int? fkVehicleTypeId;
  int? fkFuelTypeId;
  String? year;
  String? price;
  dynamic dealPrice;
  int? isNewArrival;
  int? isPopular;
  dynamic vehicleStatus;
  String? isVerified;
  dynamic totalAmount;
  DateTime? createdAt;
  int? listedDays;
  List<dynamic>? images;
  Type? vehicleType;
  Type? fuelType;

  VehicleModel({
    this.id,
    this.uniqueId,
    this.fkVehicleTypeId,
    this.fkFuelTypeId,
    this.year,
    this.price,
    this.dealPrice,
    this.isNewArrival,
    this.isPopular,
    this.vehicleStatus,
    this.isVerified,
    this.totalAmount,
    this.createdAt,
    this.listedDays,
    this.images,
    this.vehicleType,
    this.fuelType,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["id"],
        uniqueId: json["unique_id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        fkFuelTypeId: json["fk_fuel_type_id"],
        year: json["year"],
        price: json["price"],
        dealPrice: json["deal_price"],
        isNewArrival: json["is_new_arrival"],
        isPopular: json["is_popular"],
        vehicleStatus: json["vehicle_status"],
        isVerified: json["is_verified"],
        totalAmount: json["total_amount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        listedDays: json["listed_days"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        vehicleType: json["vehicle_type"] == null
            ? null
            : Type.fromJson(json["vehicle_type"]),
        fuelType:
            json["fuel_type"] == null ? null : Type.fromJson(json["fuel_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unique_id": uniqueId,
        "fk_vehicle_type_id": fkVehicleTypeId,
        "fk_fuel_type_id": fkFuelTypeId,
        "year": year,
        "price": price,
        "deal_price": dealPrice,
        "is_new_arrival": isNewArrival,
        "is_popular": isPopular,
        "vehicle_status": vehicleStatus,
        "is_verified": isVerified,
        "total_amount": totalAmount,
        "created_at": createdAt?.toIso8601String(),
        "listed_days": listedDays,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "vehicle_type": vehicleType?.toJson(),
        "fuel_type": fuelType?.toJson(),
      };
}

class Type {
  int? id;
  String? name;

  Type({
    this.id,
    this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

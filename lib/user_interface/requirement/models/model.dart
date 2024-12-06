// To parse this JSON data, do
//
//     final requirementModel = requirementModelFromJson(jsonString);

import 'dart:convert';

List<RequirementModel> requirementModelFromJson(String str) =>
    List<RequirementModel>.from(
        json.decode(str).map((x) => RequirementModel.fromJson(x)));

String requirementModelToJson(List<RequirementModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequirementModel {
  int? id;
  int? fkVehicleTypeId;
  int? fkBrandId;
  int? fkVehicleModelId;
  int? fkVehicleVariantId;
  int? fkTransmissionId;
  int? fkFuelTypeId;
  int? fkVehicleColorId;
  String? year;
  String? status;
  Brand? vehicleType;
  Brand? brand;
  Brand? vehicleModel;
  Brand? vehicleVariant;
  Brand? transmission;
  Brand? fuelType;
  Brand? vehicleColor;

  RequirementModel({
    this.id,
    this.fkVehicleTypeId,
    this.fkBrandId,
    this.fkVehicleModelId,
    this.fkVehicleVariantId,
    this.fkTransmissionId,
    this.fkFuelTypeId,
    this.fkVehicleColorId,
    this.year,
    this.status,
    this.vehicleType,
    this.brand,
    this.vehicleModel,
    this.vehicleVariant,
    this.transmission,
    this.fuelType,
    this.vehicleColor,
  });

  factory RequirementModel.fromJson(Map<String, dynamic> json) =>
      RequirementModel(
        id: json["id"],
        fkVehicleTypeId: json["fk_vehicle_type_id"],
        fkBrandId: json["fk_brand_id"],
        fkVehicleModelId: json["fk_vehicle_model_id"],
        fkVehicleVariantId: json["fk_vehicle_variant_id"],
        fkTransmissionId: json["fk_transmission_id"],
        fkFuelTypeId: json["fk_fuel_type_id"],
        fkVehicleColorId: json["fk_vehicle_color_id"],
        year: json["year"],
        status: json["status"],
        vehicleType: json["vehicle_type"] == null
            ? null
            : Brand.fromJson(json["vehicle_type"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        vehicleModel: json["vehicle_model"] == null
            ? null
            : Brand.fromJson(json["vehicle_model"]),
        vehicleVariant: json["vehicle_variant"] == null
            ? null
            : Brand.fromJson(json["vehicle_variant"]),
        transmission: json["transmission"] == null
            ? null
            : Brand.fromJson(json["transmission"]),
        fuelType: json["fuel_type"] == null
            ? null
            : Brand.fromJson(json["fuel_type"]),
        vehicleColor: json["vehicle_color"] == null
            ? null
            : Brand.fromJson(json["vehicle_color"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fk_vehicle_type_id": fkVehicleTypeId,
        "fk_brand_id": fkBrandId,
        "fk_vehicle_model_id": fkVehicleModelId,
        "fk_vehicle_variant_id": fkVehicleVariantId,
        "fk_transmission_id": fkTransmissionId,
        "fk_fuel_type_id": fkFuelTypeId,
        "fk_vehicle_color_id": fkVehicleColorId,
        "year": year,
        "status": status,
        "vehicle_type": vehicleType?.toJson(),
        "brand": brand?.toJson(),
        "vehicle_model": vehicleModel?.toJson(),
        "vehicle_variant": vehicleVariant?.toJson(),
        "transmission": transmission?.toJson(),
        "fuel_type": fuelType?.toJson(),
        "vehicle_color": vehicleColor?.toJson(),
      };
}

class Brand {
  int? id;
  String? name;

  Brand({
    this.id,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

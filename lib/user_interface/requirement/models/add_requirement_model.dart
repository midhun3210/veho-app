class AddRequirementModel {
  int? vehicleTypeId;
  int? brandId;
  int? vehicleModelId;
  int? vehicleVariantId;
  int? transmissionId;
  int? fuelTypeId;
  int? vehicleColorId;
  int? year;

  AddRequirementModel({
    this.vehicleTypeId,
    this.brandId,
    this.vehicleModelId,
    this.vehicleVariantId,
    this.transmissionId,
    this.fuelTypeId,
    this.vehicleColorId,
    this.year,
  });

  Map<String, dynamic> toJson() => {
        "vehicle_type_id": vehicleTypeId,
        "brand_id": brandId,
        "vehicle_model_id": vehicleModelId,
        "vehicle_variant_id": vehicleVariantId,
        "transmission_id": transmissionId,
        "fuel_type_id": fuelTypeId,
        "vehicle_color_id": vehicleColorId,
        "year": year,
      };
}

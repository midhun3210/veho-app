import 'package:flutter/material.dart';
import 'package:veho_app/user_interface/requirement/models/add_requirement_model.dart';
import 'package:veho_app/user_interface/requirement/models/brand_model.dart';
import 'package:veho_app/user_interface/requirement/models/model.dart';
import 'package:veho_app/user_interface/requirement/models/model_model.dart';
import 'package:veho_app/user_interface/requirement/models/variant_model.dart';
import 'package:veho_app/user_interface/requirement/service/service.dart';

class RequirementProvider extends ChangeNotifier {
  AddRequirementModel _addRequirementModel = AddRequirementModel();
  AddRequirementModel get addRequirementModel => _addRequirementModel;

  set addRequirementModel(AddRequirementModel value) {
    _addRequirementModel = value;
  }

  List<RequirementModel>? _requirementsList;

  List<RequirementModel>? get requirementsList => _requirementsList;

  set requirementsList(List<RequirementModel>? requirementsList) {
    _requirementsList = requirementsList;
    notifyListeners();
  }

  Future<void> getVendorRequirements() async {
    requirementsList = null;
    requirementsList = await RequirementSerivces().getVendorRequirements();
  }

  Future<void> AddRequirement() async {
    brandModel = null;
    await RequirementSerivces().addRequirement(_addRequirementModel.toJson());
  }

  BrandModel? _brandModel;
  BrandModel? get brandModel => _brandModel;

  set brandModel(BrandModel? v) {
    _brandModel = v;
    notifyListeners();
  }

  Future<void> getBrandData() async {
    brandModel = null;
    brandModel = await RequirementSerivces()
        .getBrandData(addRequirementModel.vehicleTypeId ?? 1);
  }

  ModelModel? _modelModel;
  ModelModel? get modelModel => _modelModel;

  set modelModel(ModelModel? v) {
    _modelModel = v;
    notifyListeners();
  }

  Future<void> getModelData() async {
    modelModel = null;
    modelModel = await RequirementSerivces().getModelData(
        addRequirementModel.vehicleTypeId!, addRequirementModel.brandId!);
    print(modelModel.toString() + "vhgvhjg");
  }

  VariantModel? _variantModel;
  VariantModel? get variantModel => _variantModel;

  set variantModel(VariantModel? v) {
    _variantModel = v;
    notifyListeners();
  }

  Future<void> getVariantData() async {
    variantModel = null;
    variantModel = await RequirementSerivces().getVariantData(
        addRequirementModel.vehicleTypeId!,
        addRequirementModel.brandId!,
        addRequirementModel.vehicleModelId!);
  }
}

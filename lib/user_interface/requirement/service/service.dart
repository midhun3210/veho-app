import 'package:veho_app/user_interface/requirement/models/brand_model.dart';
import 'package:veho_app/user_interface/requirement/models/model.dart';
import 'package:veho_app/user_interface/requirement/models/model_model.dart';
import 'package:veho_app/user_interface/requirement/models/variant_model.dart';
import 'package:veho_app/utils/core_service/serviced.dart';

class RequirementSerivces extends VehoServices {
  Future<List<RequirementModel>> getVendorRequirements() async {
    List<RequirementModel> requirementModel = [];
    try {
      var response = await get(
        'get-vendor-requirements',
      );
      if (response['data'] != null && response['data'] is List) {
        requirementModel = (response['data'] as List)
            .map((item) => RequirementModel.fromJson(item))
            .toList();
      } else {
        requirementModel = [];
      }
    } catch (e) {
      requirementModel = [];
    }
    return requirementModel;
  }

  Future<void> addRequirement(var body) async {
    try {
      final response = await post(
        'add-requirement',
        body: body,
      );

      // Handle response
      if (response.statusCode == 200) {
        print('Requirement added successfully: ${response.data}');
      } else {
        print('Failed to add requirement: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<BrandModel> getBrandData(int typeId) async {
    BrandModel brandModel = BrandModel();
    try {
      var response = await get(
        'vendor/get-brand-data/$typeId',
      );
      if (response['data'] != null) {
        brandModel = BrandModel.fromJson(response['data']);
      } else {
        //  brandModel;
      }
    } catch (e) {
      // brandModel ;
    }
    return brandModel;
  }

  Future<ModelModel> getModelData(int typeId, int brandId) async {
    ModelModel modelModel = ModelModel();
    try {
      var response = await get(
        'vendor/get-model-data/$typeId/$brandId',
      );
      print(modelModel.toString() + 'ss');
      if (response['status']) {
        modelModel = ModelModel.fromJson(response);
        print(modelModel.toString() + 'ss');
      } else {
        //  brandModel;
      }
    } catch (e) {
      // brandModel ;
    }
    return modelModel;
  }

  Future<VariantModel> getVariantData(
      int typeId, int brandId, int modelId) async {
    VariantModel modelModel = VariantModel();
    try {
      var response = await get(
        'vendor/get-variant-data/$typeId/$brandId/$modelId',
      );
      if (response['data'] != null) {
        modelModel = VariantModel.fromJson(response['data']);
      } else {
        //  brandModel;
      }
    } catch (e) {
      // brandModel ;
    }
    return modelModel;
  }
}

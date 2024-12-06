import 'package:veho_app/user_interface/requirement/models/brand_model.dart';
import 'package:veho_app/user_interface/requirement/models/model.dart';
import 'package:veho_app/utils/core_service/serviced.dart';

class RequirementSerivces {
  Future<List<RequirementModel>> getVendorRequirements() async {
    List<RequirementModel> requirementModel = [];
    try {
      var response = await VehoServices().get(
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
      final response = await VehoServices().post(
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
      var response = await VehoServices().get(
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
}

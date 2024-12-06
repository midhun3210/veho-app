import 'package:veho_app/user_interface/home/model/total_model.dart';
import 'package:veho_app/utils/core_service/serviced.dart';

class HomeSerivces {
  Future<List<VehicleModel>> getTotalVehicle() async {
    List<VehicleModel> totalVehicle = [];
    try {
      var response = await VehoServices().get(
        'vendor/get-total-vehicles',
      );
      if (response['data'] != null && response['data'] is List) {
        totalVehicle = (response['data'] as List)
            .map((item) => VehicleModel.fromJson(item))
            .toList();
      } else {
        totalVehicle = [];
      }
    } catch (e) {
      totalVehicle = [];
    }
    return totalVehicle;
  }
}

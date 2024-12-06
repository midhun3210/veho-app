import 'package:flutter/foundation.dart';
import 'package:veho_app/user_interface/home/model/total_model.dart';
import 'package:veho_app/user_interface/home/service/service.dart';

class HomeProvider extends ChangeNotifier {
  List<VehicleModel>? _totalVehicle;

  List<VehicleModel>? get totalVehicle => _totalVehicle;

  set totalVehicle(List<VehicleModel>? vehicles) {
    _totalVehicle = vehicles;
    notifyListeners();
  }

  Future<void> getTotalVehicle() async {
    totalVehicle = null;
    totalVehicle = await HomeSerivces().getTotalVehicle();
  }
}

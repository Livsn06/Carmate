import 'package:car_reservation_system/data/dummy/dd-cars.dart';
import 'package:car_reservation_system/models/md-car-infornation.dart';
import 'package:car_reservation_system/preferences/prf-car-session.dart';
import 'package:get/get.dart';

class CarInformationController extends GetxController {
  Rx<CarInformation?> car = Rx<CarInformation?>(null);
  CarSessionPreferenceKeys carSessionPreferenceKeys =
      CarSessionPreferenceKeys();
  @override
  void onInit() {
    getCarByID();
    super.onInit();
  }

  @override
  void onClose() {
    car.value = null;
    removeCarByID();
    super.onClose();
  }

  void setCarByID(int carID) async {
    carSessionPreferenceKeys.setCarId(carID);
    getCarByID();
  }

  void getCarByID() async {
    var carID = await carSessionPreferenceKeys.getCarId();
    //
    car.value = carList.firstWhere((car) => car.id == carID);
  }

  void removeCarByID() async {
    carSessionPreferenceKeys.removeCarId();
    car.value = null;
  }
}

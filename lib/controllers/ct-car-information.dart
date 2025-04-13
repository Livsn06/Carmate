import 'package:car_reservation_system/data/dummy/dd-cars.dart';
import 'package:car_reservation_system/models/md-car-infornation.dart';
import 'package:get/get.dart';

class CarInformationController extends GetxController {
  Rx<CarInformation?> car = Rx<CarInformation?>(null);

  @override
  void onReady() {
    // TODO: implement onReady

    int carID = Get.arguments;
    // print(carID);
    setCar(carID);
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    car.value = null;
    super.onClose();
  }

  void setCar(int carID) {
    printError(info: carID.toString());
    car.value = carList.firstWhere((car) => car.id == carID);
  }
}

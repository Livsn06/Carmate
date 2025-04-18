import 'package:shared_preferences/shared_preferences.dart';

class CarSessionPreferenceKeys {
  static const String carId = 'CAR-ID';

  void setCarId(int carId) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(CarSessionPreferenceKeys.carId, carId);
  }

  Future<int> getCarId() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(CarSessionPreferenceKeys.carId) ?? 0;
  }

  void removeCarId() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(CarSessionPreferenceKeys.carId);
  }

  void clear() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void updateCarId(int carId) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(CarSessionPreferenceKeys.carId, carId);
  }
}

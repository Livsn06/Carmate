import 'package:get/get.dart';

class ScreenHandlerIndexController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setCurrentIndex(0);
  }

  void setCurrentIndex(int index) => _currentIndex.value = index;
}

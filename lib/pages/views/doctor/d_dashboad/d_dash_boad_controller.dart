import 'package:get/get.dart';

class DDashBoardController extends GetxController{
    RxInt tabIndex = 0.obs;
  bool isLoading = false;
  DateTime? currentBackPressTime;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  Future<bool> onDoubleBack() {
    final DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      print(currentBackPressTime);
      return Future.value(false);
    }
    return Future.value(true);
  }


}
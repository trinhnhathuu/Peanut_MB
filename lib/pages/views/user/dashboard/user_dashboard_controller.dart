import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';
import 'package:peanut_app/providers/pregnancy_provider.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';
import 'package:peanut_app/sharedpref/shared_preference_helper.dart';

import '../../../../di_container.dart';
import '../../../../models/request/pregnancy_request.dart';
import '../../../../models/response/pregnancy_response.dart';

class DashBoardUserController extends GetxController {
  RxInt tabIndex = 0.obs;
  bool isLoading = true;
  DateTime? currentBackPressTime;
  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  PregnancyProvider pregnancyProvider = GetIt.I.get<PregnancyProvider>();
  PregnancyResponse pregnancyResponse = PregnancyResponse();
  PregnancyRequest pregnancyRequest = PregnancyRequest();
  bool isPregnancy = false;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

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
      // IZIAlert.info(message: "Do you want exit the application.");
      return Future.value(false);
    }
    return Future.value(true);
  }

  void getData() {
    sl.get<SharedPreferenceHelper>().userId.then((value) => {
          taiKhoanProvider.findById(
              id: value!,
              onSuccess: (data) {
                taiKhoanResponse = data;
                print(data);
                isLoading = false;
                update();
                getPregnacy(data.id.toString());
              },
              onError: (onError) {
                print(onError);
              })
        });
  }

  void getPregnacy(String userId) {
    pregnancyProvider.getPregnancyByUserId(
        userId: userId,
        onSuccess: (data) {
          pregnancyResponse = data;
          print(pregnancyResponse.toJson());
          if (pregnancyResponse != null) {
            isPregnancy = true;
            isLoading = false;
            update();
          }
        },
        onError: (err) {
          print(err);
        });
  }
}

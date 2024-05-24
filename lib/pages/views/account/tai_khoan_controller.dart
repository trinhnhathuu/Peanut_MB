import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';
import 'package:peanut_app/routes/app_routes.dart';

import '../../../di_container.dart';
import '../../../models/response/tai_khoan_response.dart';
import '../../../sharedpref/shared_preference_helper.dart';

class TaiKhoanController extends GetxController {
  bool isLoading = true;
  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  var taiKhoanResponse = TaiKhoanResponse().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void onRefresh() {
    isLoading = true;
    getData();
  }

  void getData() {
    sl.get<SharedPreferenceHelper>().userId.then((value) => {
          taiKhoanProvider.findById(
              id: value!,
              onSuccess: (data) {
                taiKhoanResponse.value = data;
                print(taiKhoanResponse.toJson());
                print(data);
                isLoading = false;
                update();
              },
              onError: (onError) {
                print(onError);
              })
        });
  }

  void logout() {
      sl.get<SharedPreferenceHelper>().removeUserId();
            sl
                .get<SharedPreferenceHelper>()
                .removeAccessToken();
            sl
                .get<SharedPreferenceHelper>()
                .removeRefreshToken();
            sl
                .get<SharedPreferenceHelper>()
                .removeTypeAccount();
      
      Get.offAllNamed(AppRoutes.LOGIN);
      Get.showSnackbar(const GetBar(
        message: 'Đăng xuất thành công',
        duration: Duration(seconds: 2),
      ));
  }
}

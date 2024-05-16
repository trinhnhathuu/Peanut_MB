import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/response/poster_response.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';
import 'package:peanut_app/providers/poster_provider.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';
import 'package:peanut_app/routes/app_routes.dart';
import 'package:peanut_app/sharedpref/shared_preference_helper.dart';

import '../../../../di_container.dart';

class UHomeController extends GetxController {
  bool isLoading = true;
  RxInt tabIndex = 0.obs;
  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  PosterProvider posterProvider = GetIt.I.get<PosterProvider>();
  PosterResponse posterResponse = PosterResponse();
  List<PosterResponse> listPoster = [];

  @override
  void onInit() {
    super.onInit();
    getData();
    getPoster();
  }

  void getData() {
    sl.get<SharedPreferenceHelper>().userId.then((value) => {
          taiKhoanProvider.findById(
              id: value!,
              onSuccess: (data) {
                taiKhoanResponse = data;
                print(data);
                update();
                // Get.showSnackbar(
                //     GetSnackBar(title: 'Chào mừng', message: data.name));
              },
              onError: (onError) {
                print(onError);
              })
        });
  }

  void getPoster() {
    posterProvider.getALLPoster(onSuccess: (data) {
      listPoster = data;
      isLoading = false;
      update();
    }, onError: (onError) {
      print(onError);
    });
  }

  void toPosterDetail( PosterResponse posterResponse) {
    Get.toNamed(AppRoutes.U_CHI_TIET_BAI_VIET, arguments: posterResponse);
  }
}

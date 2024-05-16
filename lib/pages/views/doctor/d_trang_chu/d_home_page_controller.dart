
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/di_container.dart';

import '../../../../models/response/poster_response.dart';
import '../../../../models/response/tai_khoan_response.dart';
import '../../../../providers/poster_provider.dart';
import '../../../../providers/tai_khoan_provider.dart';
import '../../../../routes/app_routes.dart';
import '../../../../sharedpref/shared_preference_helper.dart';

class DHomePageController extends GetxController{
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
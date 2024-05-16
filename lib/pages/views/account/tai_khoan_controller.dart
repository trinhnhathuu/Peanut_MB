
 import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';

import '../../../di_container.dart';
import '../../../models/response/tai_khoan_response.dart';
import '../../../sharedpref/shared_preference_helper.dart';

class TaiKhoanController extends GetxController{
  bool isLoading = true;
  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();

   @override
  void onInit() {
    super.onInit();
    getData();
  }
  void getData() {
    sl.get<SharedPreferenceHelper>().userId.then((value) => {
          taiKhoanProvider.findById(
              id: value!,
              onSuccess: (data) {
                taiKhoanResponse = data;
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
}
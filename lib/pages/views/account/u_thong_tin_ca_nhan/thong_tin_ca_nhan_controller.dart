import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';

import '../../../../di_container.dart';
import '../../../../models/response/tai_khoan_response.dart';
import '../../../../routes/app_routes.dart';
import '../../../../sharedpref/shared_preference_helper.dart';

class ThongTinCaNhanController extends GetxController {
  bool isLoading = true;
  String title = 'Thông tin cá nhân';
  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  TextEditingController hovatenController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController diachiController = TextEditingController();
  TextEditingController sdtController = TextEditingController();
  TextEditingController ngaySinhController = TextEditingController();
  TextEditingController gioiTinhController = TextEditingController();

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
                if (taiKhoanResponse.email != 'null') {
                  emailController.text = taiKhoanResponse.email.toString();
                }
                if (taiKhoanResponse.name != 'null') {
                  hovatenController.text = taiKhoanResponse.name.toString();
                } else {
                  hovatenController.text = "";
                }
                if (taiKhoanResponse.address != null) {
                  diachiController.text = taiKhoanResponse.address.toString();
                } else {
                  diachiController.text = "";
                }

                if (taiKhoanResponse.phone != null) {
                  sdtController.text = taiKhoanResponse.phone.toString();
                } else {
                  sdtController.text = "";
                }
                if (taiKhoanResponse.birthday != null) {
                  ngaySinhController.text =
                      taiKhoanResponse.birthday.toString();
                } else {
                  ngaySinhController.text = "";
                }

                if (taiKhoanResponse.gender != null) {
                  gioiTinhController.text = taiKhoanResponse.gender.toString();
                } else {
                  gioiTinhController.text = "";
                }
                isLoading = false;
                update();
              },
              onError: (onError) {
                print(onError);
              })
        });
  }


  void goToChinhSua(){
    Get.toNamed(AppRoutes.CHINH_SUA_THONG_TIN_CA_NHAN, arguments: taiKhoanResponse);
  }
}

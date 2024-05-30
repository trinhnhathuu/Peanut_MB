import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/tai_khoan_request.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';
import 'package:peanut_app/models/response/token_key_response.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';

import '../../../di_container.dart';
import '../../../routes/app_routes.dart';
import '../../../sharedpref/shared_preference_helper.dart';
import '../../../utils/app_constants.dart';
import '../../basewidget/upload_image.dart';

class LoginController extends GetxController {
  bool taiKhoan = true;
  bool isObscure = true;
  TextEditingController hoTen = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController matKhau = TextEditingController();
  TaiKhoanRequest taiKhoanRequest = TaiKhoanRequest();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  final TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TokenKeyResponse tokenKeyResponse = TokenKeyResponse();

  @override
  void onInit() {}

  IconButton showPassWord() {
    return IconButton(
        onPressed: () {
          isObscure = !isObscure;
          update();
        },
        icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility));
  }

  void dangKyTaiKhoan() {
    if (taiKhoan == false) {
      if (hoTen.text.isEmpty) {
        Get.snackbar("Thông báo", "Vui lòng nhập nhập Họ và tên của bạn",
            snackPosition: SnackPosition.TOP);
        return;
      } else {
        taiKhoanRequest.name = hoTen.text;
      }
    }
    if (email.text.isEmpty) {
      Get.snackbar("Thông báo", "Vui lòng email",
          snackPosition: SnackPosition.TOP);
      return;
    }
    if (matKhau.text.isEmpty) {
      Get.snackbar("Thông báo", "Vui lòng nhập mật khẩu",
          snackPosition: SnackPosition.TOP);
      return;
    }
    taiKhoanRequest.email = email.text;
    taiKhoanRequest.password = matKhau.text;
    if (taiKhoan == false) {
      taiKhoanProvider.create(
          data: taiKhoanRequest,
          onSuccess: (taiKhoanRequest) {
            taiKhoan = true;
            email.clear();
            matKhau.clear();
            hoTen.clear();
            update();
            FocusScope.of(Get.context!).unfocus();
            Get.snackbar("Thông báo", "Đăng ký thành công",
                snackPosition: SnackPosition.TOP);
          },
          onError: (error) {
            Get.snackbar("Thông báo", "Đăng ký thất bại",
                snackPosition: SnackPosition.TOP);
          });
    } else {
      taiKhoanProvider.findByEmail(
          data: taiKhoanRequest,
          onSuccess: (taiKhoanResponse, tokenKeyResponse) {
            sl.get<SharedPreferenceHelper>().saveUserId(taiKhoanResponse.id!);
            sl
                .get<SharedPreferenceHelper>()
                .saveAccessToken(tokenKeyResponse.accessToken!);
            sl
                .get<SharedPreferenceHelper>()
                .saveRefreshToken(tokenKeyResponse.refreshToken!);
           
            tokenKeyResponse = tokenKeyResponse;
            if (taiKhoanResponse.role!.last.toString() == ROLE_DOCTOR) {
               sl
                .get<SharedPreferenceHelper>()
                .saveTypeAccount(taiKhoanResponse.role!.last.toString());
              Get.offAllNamed(AppRoutes.D_DASHBOARD,
                  predicate: ModalRoute.withName(AppRoutes.D_DASHBOARD));
              Get.snackbar("Thông báo 😀", "Đăng nhập thành công",
                  snackPosition: SnackPosition.TOP);
            } else {
               sl
                .get<SharedPreferenceHelper>()
                .saveTypeAccount(taiKhoanResponse.role!.first.toString());
              Get.offAllNamed(AppRoutes.U_DASHBOARD,
                  predicate: ModalRoute.withName(AppRoutes.U_DASHBOARD));
              Get.snackbar("Chào mừng", "bạn đến với Peanut",
                  snackPosition: SnackPosition.TOP);
            }
           
            update();
          },
          onError: (err) {
            Get.snackbar(" 😀", "Đăng ký thông bị");
            Get.snackbar("Thông báo", "Email hoặc mật khẩu của bạn bị sai",
                snackPosition: SnackPosition.TOP);
          });
    }
  }
}

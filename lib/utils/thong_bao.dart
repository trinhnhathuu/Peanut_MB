import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/utils/color_peanut.dart';

class ThongBao extends GetSnackBar {
  void ThanhCong(String message) {
    Get.snackbar(
      backgroundColor: ColorPeanut.COLORS_SUCCESS,
      "Thông báo", message);
  }
  void CanhBao(String message) {
    Get.snackbar(
      backgroundColor: Colors.amber,
      "Thông báo", message);
  }
}

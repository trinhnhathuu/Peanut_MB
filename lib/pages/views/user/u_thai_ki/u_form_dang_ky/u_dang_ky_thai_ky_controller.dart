import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/routes/app_routes.dart';

class DangKyThaiKyFormController extends GetxController{

  List test = ['1', '2', '3'];
  String? t;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void submitForm(){
    Get.offAndToNamed(AppRoutes.U_THAI_KY);
  }
}
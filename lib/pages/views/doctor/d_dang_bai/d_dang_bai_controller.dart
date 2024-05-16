

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DDangBaiController extends GetxController{
  bool isLoading = false;
  TextEditingController noiDungBaiDangController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    noiDungBaiDangController.text = ' Xin chào các bác sĩ, em là Quỳnh Nga và em mới mang thai được hơn 1 tháng. Đây là lần đầu em mang thai nên em khá lo lắng. Mong các bác sĩ tư vấn giúp em về những điều cần biết khi mang thai lần đầu? Em nên làm gì để cả mẹ và bé đều khỏe mạnh, phát triển tốt?';
  }
}
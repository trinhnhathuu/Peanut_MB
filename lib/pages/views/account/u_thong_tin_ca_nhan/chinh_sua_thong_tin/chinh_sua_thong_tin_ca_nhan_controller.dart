import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/tai_khoan_request.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';
import 'package:peanut_app/pages/basewidget/upload_image.dart';

import '../../../../../providers/tai_khoan_provider.dart';

class ChinhSuaThongTinCaNhanController extends GetxController {
  bool isLoading = true;
  RxString imageUrl = ''.obs;
  ImageUploader imageUploader = ImageUploader(bucketName: 'images');
  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TaiKhoanRequest taiKhoanRequest = TaiKhoanRequest();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  TextEditingController hovatenController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController diachiController = TextEditingController();
  TextEditingController sdtController = TextEditingController();
  TextEditingController ngaySinhController = TextEditingController();
  TextEditingController gioiTinhController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData() {
    if (Get.arguments != null) {
      taiKhoanResponse = Get.arguments;
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
        ngaySinhController.text = taiKhoanResponse.birthday.toString();
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
    }
  }
   void getAnh() async {
    String? imageUrlValue = await imageUploader.uploadImage();
    if (imageUrlValue != null) {
      imageUrl.value = imageUrlValue;
    }
    update();
  }
  String anh(){
    if(taiKhoanResponse.avatar != null){
      return taiKhoanResponse.avatar!;
    }
    if(imageUrl.value != null){
      return imageUrl.value;
    }
    return 'https://i.pinimg.com/564x/06/a5/7a/06a57ace69d0656fb296a45ed46755d9.jpg';
  }


  void updateData() {
    taiKhoanRequest.id = taiKhoanResponse.id;
    taiKhoanRequest.name = hovatenController.text;
    taiKhoanRequest.address = diachiController.text;
    taiKhoanRequest.phone = sdtController.text;
    taiKhoanRequest.birthday = ngaySinhController.text;
    taiKhoanRequest.gender = gioiTinhController.text;
    taiKhoanRequest.email = emailController.text;
    taiKhoanRequest.avatar = imageUrl.value;
    taiKhoanProvider.updateUsers(
        data: taiKhoanRequest,
        onSuccess: (data) {
          print(data.toJson());
          Get.back();
          Get.back();
          Get.snackbar('Thông báo', 'Cập nhật thành công');
        },
        onError: (onError) {
          print(onError);
        });
  }
}

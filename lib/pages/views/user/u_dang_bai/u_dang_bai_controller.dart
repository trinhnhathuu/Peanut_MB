import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/poster_request.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';
import 'package:peanut_app/pages/basewidget/upload_image.dart';
import 'package:peanut_app/providers/poster_provider.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';
import 'package:peanut_app/sharedpref/shared_preference_helper.dart';
import 'package:peanut_app/utils/color_peanut.dart';

import '../../../../di_container.dart';
import '../../../../utils/thong_bao.dart';

class UBaiDangController extends GetxController {
  bool isLoading = true;
  TextEditingController noiDungBaiDangController = TextEditingController();
  TextEditingController tieuDeController = TextEditingController();
  RxString imageUrl = ''.obs;
  ImageUploader imageUploader = ImageUploader(bucketName: 'images');

  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  PosterRequest posterRequest = PosterRequest();
  PosterProvider posterProvider = GetIt.I.get<PosterProvider>();
  ThongBao thongBao = ThongBao();
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
                isLoading = false;
                update();
              },
              onError: (onError) {
                print(onError);
              })
        });
  }

  void getAnh() async {
    String? imageUrlValue = await imageUploader.uploadImage();
    if (imageUrlValue != null) {
      imageUrl.value = imageUrlValue;
    }
    update();
  }

  Future<void> dangBai() async {
    if (tieuDeController.text.isEmpty) {
      thongBao.CanhBao('Vui loại điền tiêu đề');
    }
    if (noiDungBaiDangController.text.isEmpty) {
      thongBao.CanhBao('Vui loại điền nội dung bài đăng');
    }
   
    posterRequest.content = noiDungBaiDangController.text;
    posterRequest.image = imageUrl.value;
    posterRequest.userId = taiKhoanResponse.id;
    posterRequest.type = 'normal';
    posterRequest.title = tieuDeController.text;

    posterProvider.create(
        data: posterRequest,
        onSuccess: (data) {
          print(data);
          noiDungBaiDangController.clear();
          tieuDeController.clear();
          imageUrl.value = '';
          
          update();
          Get.snackbar(
            backgroundColor: ColorPeanut.COLORS_SUCCESS,
            "Thông báo",
            "Đăng bài thành công",
          );
        },
        onError: (onError) {});
  }
}

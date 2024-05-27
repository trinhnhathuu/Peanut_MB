import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/providers/poster_provider.dart';

import '../../../../models/response/poster_response.dart';
import '../../../../models/response/tai_khoan_response.dart';

class QuanLyBaiVietController extends GetxController {
  bool isLoading = true;
  PosterProvider posterProvider = GetIt.I.get<PosterProvider>();
  PosterResponse posterResponse = PosterResponse();
  List<PosterResponse> listPoster = [];
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  String userId = "";

  @override
  void onInit() {
    getArgument();
    super.onInit();
    update();
  }

  void getArgument() {
    if (Get.arguments != null) {
      taiKhoanResponse = Get.arguments as TaiKhoanResponse;
      print(taiKhoanResponse.toJson());
      getPosterByUserId(userId: taiKhoanResponse.id.toString());
      update();
    }
  }

  void getPosterByUserId({required String userId}) {
    posterProvider.getPosterByUserId(
      page: 1,
      limit: 10,
      userId: userId,
      onSuccess: (data) {
        listPoster = data;
        isLoading = false;
        update();
      },
      onError: (onError) {
        print(onError);
      },
    );
  }

  void deletePoster({required String id}) {
    posterProvider.delete(
      id: id,
      onSuccess: (data) {
        getPosterByUserId(userId: userId);
        isLoading = false;
        update();
      },
      onError: (onError) {
        print(onError);
      },
    );
  }
}

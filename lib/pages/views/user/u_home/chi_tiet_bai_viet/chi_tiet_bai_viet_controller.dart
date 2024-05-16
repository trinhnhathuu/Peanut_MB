import 'package:get/get.dart';
import 'package:peanut_app/models/response/poster_response.dart';

class ChiTietBaiVietController extends GetxController {
  bool isLoading = false;
  String title = '';
  PosterResponse posterResponse = PosterResponse();

  @override
  void onInit() {
    posterResponse = Get.arguments as PosterResponse;
    title = posterResponse.title!;
    isLoading = false;
    update();
  }
}

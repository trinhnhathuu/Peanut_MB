import 'package:get/get.dart';
import 'package:peanut_app/pages/views/doctor/d_dashboad/d_dash_boad_controller.dart';
import 'package:peanut_app/pages/views/doctor/d_trang_chu/d_home_page_controller.dart';
import 'package:peanut_app/pages/views/user/dashboard/user_dashboard_controller.dart';
import 'package:peanut_app/pages/views/user/u_home/u_home_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardUserController>(() => DashBoardUserController());
    Get.lazyPut<DDashBoardController>(() => DDashBoardController());
    Get.lazyPut<UHomeController>(() => UHomeController());
    Get.lazyPut<DHomePageController>(() => DHomePageController());
  }
}
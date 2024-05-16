
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/dashboard/user_dashboard_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../utils/images.dart';
import '../../account/tai_khoan_page.dart';
import '../u_dang_bai/u_dang_bai_page.dart';
import '../u_home/u_home_page.dart';
import '../u_lich_hen/u_lich_hen.dart';
import '../u_thai_ki/u_thai_ki_page.dart';

class DashBoardUserPage extends GetView<DashBoardUserController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<DashBoardUserController>(
        init: DashBoardUserController() ,
        builder:(controller){
          if(controller.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return WillPopScope(
              child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
                child: Scaffold(
                  body: Center(
                    child: IndexedStack(
                      index: controller.tabIndex.value,
                      children: [
                        UHomePage(),
                        ThaiKyPage(),
                        UBaiDangPage(),
                        ULichHenPage(),
                        TaiKhoanPage(),
                      ],

                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: ColorPeanut.ICON_DASH_BOARD,
                    backgroundColor: Colors.white,
                    onTap: controller.changeTabIndex,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: controller.tabIndex.value,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    items: [
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.home_dashboard),
                        label: '',
                        // label: 'Trang chủ',
                        isSelected: controller.tabIndex == 0,
                      ),
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.thai_ky_dash_board),
                        // label: 'Thai Kỳ',
                        label: '',
                        isSelected: controller.tabIndex == 1,
                      ),
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.them_tin_dash_board),
                        label: '',
                        // label: 'Đăng Bài',
                        isSelected: controller.tabIndex == 2,
                      ),
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.lich_kham_dash_board),
                        // label: 'Lịch Khám',
                        label: '',
                        isSelected: controller.tabIndex == 3,
                      ),
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.profile_dash_board),
                        label: '',
                        // label: 'Tài Khoản',
                        isSelected: controller.tabIndex == 4,
                      ),
                    ],
                  ),
                ),
          ), onWillPop: ()=> controller.onDoubleBack());
        });
  }
    
}
BottomNavigationBarItem _bottomNavigationBarItem({
  required ImageProvider image,
  required String label,
  bool isSelected = false,
}) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.transparent,
    activeIcon: SizedBox(
      // width: DeviceUtils.getScaledWidth(Get.context!, 0.16),
      // height: DeviceUtils.getScaledHeight(Get.context!, 0.08),
      child: Container(
        padding: isSelected ? const EdgeInsets.all(4) : const EdgeInsets.all(0),
        child: Image(
          color: isSelected ? ColorPeanut.ICON_DASH_BOARD : const Color(0xffA4A2A2),
          width:DeviceUtils.getScaledWidth(Get.context!, 0.1),
          height: DeviceUtils.getScaledHeight(Get.context!, 0.04),
          image: image,
          fit: BoxFit.contain,
        ),
      ),
    ),
    icon: SizedBox(
        width:DeviceUtils.getScaledWidth(Get.context!, 0.1),
        height: DeviceUtils.getScaledHeight(Get.context!, 0.04),
      child: Container(
        padding: isSelected ? const EdgeInsets.all(4) : const EdgeInsets.all(0),
        child: Image(
          color: isSelected ? ColorPeanut.ICON_DASH_BOARD : const Color(0xffA4A2A2),
          image: image,
          fit: BoxFit.contain,
        ),
      ),
    ),
    label: label,
  );
}

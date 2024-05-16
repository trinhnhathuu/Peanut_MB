import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/account/tai_khoan_page.dart';
import 'package:peanut_app/pages/views/doctor/d_dang_bai/d_dang_bai_page.dart';
import 'package:peanut_app/pages/views/doctor/d_dashboad/d_dash_boad_controller.dart';
import 'package:peanut_app/pages/views/doctor/d_lich_hen/d_lich_hen_page.dart';
import 'package:peanut_app/pages/views/doctor/d_trang_chu/d_home_page.dart';

import '../../../../utils/color_peanut.dart';
import '../../../../utils/images.dart';

class DDashBoardPage extends GetView<DDashBoardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DDashBoardController>(
        init: DDashBoardController(),
        builder: (controller) {
          if (controller.isLoading) {
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
                        DHomePage(),
                        DDangBaiPage(),
                        DLichHenPage(),
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
                        label: 'Trang chủ',
                        isSelected: controller.tabIndex == 0,
                      ),
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.them_tin_dash_board),
                        label: 'Đăng Bài',
                        isSelected: controller.tabIndex == 1,
                      ),
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.lich_kham_dash_board),
                        label: 'Lịch Khám',
                        isSelected: controller.tabIndex == 2,
                      ),
                      _bottomNavigationBarItem(
                        image: const AssetImage(Images.profile_dash_board),
                        label: 'Tài Khoản',
                        isSelected: controller.tabIndex == 3,
                      ),
                    ],
                  ),
                ),
              ),
              onWillPop: () => controller.onDoubleBack());
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
      width: 40,
      height: 40,
      child: Container(
        padding: isSelected ? const EdgeInsets.all(6) : const EdgeInsets.all(4),

        child: Image(
          color: isSelected ? ColorPeanut.ICON_DASH_BOARD : const Color(0xffA4A2A2),
          width: 30,
          height: 30,
          image: image,
          fit: BoxFit.contain,
        ),
      ),
    ),
    icon: SizedBox(
      width: 40,
      height: 30,
      child: Container(
        padding: isSelected ? const EdgeInsets.all(6) : const EdgeInsets.all(4),
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

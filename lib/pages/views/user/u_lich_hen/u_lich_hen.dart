import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/lich_hen/danh_sach_lich_hen_page.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/u_lich_hen_controller.dart';
import 'package:peanut_app/routes/app_routes.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../utils/color_peanut.dart';
import '../../../../utils/images.dart';

class ULichHenPage extends GetView<ULichHenController> {
  @override
  Widget build(BuildContext context) {
    // Your code here
    return GetBuilder(
        init: ULichHenController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: const Text(
                  'Lịch hẹn',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: ColorPeanut.APPBAR_BACKGROUND,
            ),
            floatingActionButton: GestureDetector(
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.U_DANG_KY_LICH_HEN);
                
                },
                child: Container(
                  alignment: Alignment.center,
                  width: DeviceUtils.getScaledWidth(context, 0.2),
                  height: DeviceUtils.getScaledHeight(context, 0.05),
                  decoration: BoxDecoration(
                      color: ColorPeanut.BUTTON_DONGY,
                      borderRadius: BorderRadius.circular(100.0)
                  ),
                  child: Text('Đặt lịch',style: TextStyle(
                      color: Colors.white
                  ),),
                ),
              ),
            ),

            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                  coLichHen(context)
                  ],
                ),
              ),
            ),
          );
        });
  }
}



Widget coLichHen(BuildContext context){
  return DefaultTabController(
    length: 2,
    initialIndex: 0,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: PDimensions.SPACE_SIZE_1X),
          alignment: Alignment.center,
          width: 350,
          height: 43,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: TabBar(
            tabs: <Tab>[
              Tab(text: "Lịch Hẹn"),
              Tab(text: "Lịch Sử"),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Color.fromARGB(255, 255, 255, 255),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: ColorPeanut.BUTTON_DONGY,
            ),
          ),
        ),
        Container(
          height: DeviceUtils.getScaledHeight(context, 1),
          child: Expanded(
            child: TabBarView(
              children: [
                DanhSachLichHenPage(),
                Text('helllo')
              ],
            ),
          ),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/color_peanut.dart';
import '../../../../utils/demensions.dart';
import '../../../../utils/device_utils.dart';
import '../../../../utils/images.dart';
import 'd_danh_sach_lich_hen/d_danh_sach_lich_hen_page.dart';
import 'd_lich_hen_controller.dart';

class DLichHenPage extends GetView<DLichHenController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DLichHenController(),
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
            
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if(controller.lichhen.isEmpty)
                      chuaCoLichHen(context),
                    if(controller.lichhen.isNotEmpty)
                      coLichHen(context)
                  ],
                ),
              ),
            ),
          );
        });

  }}


Widget chuaCoLichHen(
    BuildContext context
    ){
  return  Center(
    child: Container(
      margin: EdgeInsets.only(
          top: PDimensions.SPACE_SIZE_05),
      width: DeviceUtils.getScaledWidth(context, 0.9),
      height: DeviceUtils.getScaledHeight(context, 0.4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        direction: Axis.vertical,
        children: [
          Image.asset(Images.anh_lich_hen),
          Text(' Hiện tại chưa có lịch hẹn nào'),
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.U_DANG_KY_LICH_HEN);
            },
            child: Container(
              alignment: Alignment.center,
              width: DeviceUtils.getScaledWidth(context, 0.4),
              height: DeviceUtils.getScaledHeight(context, 0.05),
              decoration: BoxDecoration(
                  color: ColorPeanut.BUTTON_DONGY,
                  borderRadius: BorderRadius.circular(100.0)
              ),
              child: Text('Đặt lịch hẹn ngay',style: TextStyle(
                  color: Colors.white

              ),),
            ),
          ),
          Container(
            width: DeviceUtils.getScaledWidth(context, 0.8),
            child: RichText(
                text: TextSpan(
                    text: '1.Kiểm tra bạn đã kết nố hồ sơ ý tết chưa',
                    style: TextStyle(
                      fontSize: PDimensions.FONT_DEFAULT,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text:" tại đây",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: PDimensions.FONT_DEFAULT

                        ),
                      )
                    ]
                )
            ),
          ),

          Container(
            width: DeviceUtils.getScaledWidth(context, 0.8),
            child: RichText(
                text: TextSpan(
                    text: '2.Kiểm tra thông tin đặt lịch và thông tin hồ sơ cá nhân có chính xác không',
                    style: TextStyle(
                      fontSize: PDimensions.FONT_DEFAULT,
                      color: Colors.grey,

                    ),
                    children: [
                      TextSpan(
                        text:" tại đây",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: PDimensions.FONT_DEFAULT
                        ),
                      )
                    ]
                )
            ),
          )

        ],),
    ),
  );
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
                DDanhSachLichHenPage(),
                Text('helllo')
              ],
            ),
          ),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/lich_hen/danh_sach_lich_hen_controller.dart';
import 'package:peanut_app/routes/app_routes.dart';
import 'package:peanut_app/utils/demensions.dart';

import '../../../../../utils/color_peanut.dart';
import '../../../../../utils/device_utils.dart';
import '../../../../../utils/images.dart';
import '../../../../basewidget/card_custom.dart';

class DanhSachLichHenPage extends GetView<DanhSachLichHenController>{
  @override
  Widget build(BuildContext context) {
    // Your code here
    return GetBuilder(
        init: DanhSachLichHenController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              floatingActionButton: controller.lichHenList.isEmpty ? null :GestureDetector(
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
                  child: const Text('Đặt lịch',style: TextStyle(
                      color: Colors.white
                  ),),
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(controller.lichHenList.isEmpty) chuaCoLichHen(context),
                    if(controller.lichHenList.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.lichHenList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.U_CHI_TIET_LICH_HEN,
                                arguments: controller.lichHenList[index]);
                          },
                          child: CardCustom(
                            TrangThai: controller.lichHenList[index].status.toString() == '1' ? 'Đang chờ' : 'Đã xác nhận',
                            imagePath: Images.anh_test,
                            title: 'Lịch hẹn ${controller.lichHenList[index].name}',
                            doctorName: controller.lichHenList[index].doctorId!.fullName.toString(),
                            hospital: controller.lichHenList[index].idHospital!.name.toString(),
                            appointmentTime: '${controller.lichHenList[index].time.toString()} ${controller.lichHenList[index].date.toString()}',
                            onContactDoctor: () {},
                            onSeeDetails: () {
                              Get.toNamed(AppRoutes.U_CHI_TIET_LICH_HEN,
                                  arguments: controller.lichHenList[index]);
                            },
                          ),
                    );
                      })
                
                  ],
                ),
              ),
            ),
          );
        });
  }
}


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
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        direction: Axis.vertical,
        children: [
          Image.asset(Images.anh_lich_hen),
          const Text(' Hiện tại chưa có lịch hẹn nào'),
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
              child: const Text('Đặt lịch hẹn ngay',style: TextStyle(
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
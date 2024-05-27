
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../routes/app_routes.dart';
import '../../../../../utils/color_peanut.dart';
import '../../../../../utils/device_utils.dart';
import '../../../../../utils/images.dart';
import '../../../../basewidget/card_custom.dart';
import 'd_danh_sach_lich_hen_controller.dart';

class DDanhSachLichHenPage extends GetView<DDanhSachLichHenController>{
  @override
   Widget build(BuildContext context) {
    // Your code here
    return GetBuilder(
        init: DDanhSachLichHenController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(controller.lichHenList.isEmpty) const Center(child: Text('Trống')),
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
                            TrangThai: controller.lichHenList[index].status.toString() == '1'? 'Đặt lịch' : 'Đã hẹn' ,
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
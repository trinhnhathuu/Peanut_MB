
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../routes/app_routes.dart';
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
                  children: [
                    CardCustom(
                      imagePath: Images.anh_test,
                      title: 'Appointment Title',
                      doctorName: 'Doctor A',
                      hospital: 'Hospital X',
                      appointmentTime: '8h - 8/03/2024',
                      onContactDoctor: () {
                        // Handle contact doctor
                      },
                      onSeeDetails: () {
                        Get.toNamed(AppRoutes.D_CHI_TIET_LICH_HEN);
                      },
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
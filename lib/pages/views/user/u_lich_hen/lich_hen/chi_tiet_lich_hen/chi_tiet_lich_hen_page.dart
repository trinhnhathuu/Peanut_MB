import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/lich_hen/chi_tiet_lich_hen/chi_tiet_lich_hen_controller.dart';
import 'package:peanut_app/utils/app_constants.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../../../utils/images.dart';
import '../../../../../basewidget/card_infomation_lich_hen.dart';

class ChiTietLichHenPage extends GetView<ChiTietLichHenController> {
  @override
  Widget build(BuildContext context) {
    // Your code here
    return GetBuilder(
        init: ChiTietLichHenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                title: const Text('Chi tiết lịch hẹn'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                )),
            body: Container(
              margin: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      width: DeviceUtils.getScaledWidth(context, 0.9),
                      height: DeviceUtils.getScaledHeight(context, 0.4),
                      child: Image.asset(
                        Images.img_chi_tiet_kham,
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(height: 20),
                  // Lịch đã hẹn khám
                  const Text('Lịch Đã Hẹn Khám',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  DoctorInfoWidget(
                      doctorName:
                          controller.appointment!.doctorId!.fullName.toString(),
                      date: controller.appointment!.date.toString(),
                      time: controller.appointment!.time.toString(),
                      hospitalName:
                          controller.appointment!.idHospital!.name.toString(),
                      phoneNumber: controller.appointment!.doctorId!.phoneWork
                          .toString(),
                      email: controller.appointment!.doctorId!.emailWork
                          .toString()),

                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Text('Thông tin người khám',
                              style: TextStyle(
                                fontSize: PDimensions.FONT_SIZE_H7,
                                fontWeight: FontWeight.bold,
                              )),
                          // Thông tin họ và tên
                          Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Họ và tên'),
                              Text(controller.appointment!.name.toString()),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Thông tin số điện thoại
                          Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: [
                              Text('Số điện thoại'),
                              Text(controller.appointment!.phone.toString()),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Thông tin Email
                          // const Flex(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          //   direction: Axis.horizontal,
                          //   children: [
                          //     Text('Email'),
                          //     Text('huu123@gmail.com'),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {},
                    child: const Text('Hủy'),
                  ),
                ),
                if (controller.userRole == ROLE_DOCTOR)
                  GestureDetector(
                    onTap: () {
                      controller.xacNhanLichHen();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {},
                        child: const Text('Xác Nhận'),
                      ),
                    ),
                  ),
              ],
            ),
          );
        });
  }
}

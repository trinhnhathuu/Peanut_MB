
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/doctor/d_lich_hen/d_danh_sach_lich_hen/d_chi_tiet_lich_hen/d_chi_tiet_lich_hen_controller.dart';

import '../../../../../../utils/demensions.dart';
import '../../../../../../utils/device_utils.dart';
import '../../../../../../utils/images.dart';
import '../../../../../basewidget/card_infomation_lich_hen.dart';

class DChiTietLichHenPage extends GetView<DChiTietLichHenController>{
  @override
  Widget build(BuildContext context) {
    // Your code here
    return GetBuilder(
        init: DChiTietLichHenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                title: Text('Chi tiết lịch hẹn'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                )
            ),
            body: Container(
              margin: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      width: DeviceUtils.getScaledWidth(context, 0.9),
                      height: DeviceUtils.getScaledHeight(context, 0.4),
                      child: Image.asset(
                        Images.chi_tiet_lich_hen,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(height: 20),
                  // Lịch đã hẹn khám
                  Text('Lịch Đã Hẹn Khám',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  DoctorInfoWidget(
                      doctorName: 'DR. MM',
                      date: 'Monday, Dec 23',
                      time: '12:00-13:00',
                      hospitalName: 'Family Hospital',
                      phoneNumber: '0123456789',
                      email: 'nhataj huuwx@@@'),

                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
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
                              Text('Trịnh Nhật Hũu'),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Thông tin số điện thoại
                          Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            direction: Axis.horizontal,
                            children: [
                              Text('Số điện thoại'),
                              Text('0123456789'),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Thông tin Email
                          Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            direction: Axis.horizontal,
                            children: [
                              Text('Email'),
                              Text('huu123@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),

            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
                child: Text('Hủy'),
              ),
            ),
          );
        });
  }
}
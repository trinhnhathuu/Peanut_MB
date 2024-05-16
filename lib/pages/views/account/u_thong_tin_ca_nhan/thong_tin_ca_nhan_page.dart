import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/account/u_thong_tin_ca_nhan/thong_tin_ca_nhan_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';

import '../../../../../routes/app_routes.dart';

class ThongTinCaNhanPage extends GetView<ThongTinCaNhanController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
        init: ThongTinCaNhanController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(controller.title),
                centerTitle: true,
                backgroundColor: ColorPeanut.APPBAR_BACKGROUND,
              ),
              body: Container(
                margin: EdgeInsets.only(
                    left: PDimensions.SPACE_SIZE_3X,
                    right: PDimensions.SPACE_SIZE_3X),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Thông tin cơ bản',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.goToChinhSua();
                            },
                            child: const Text(
                              'Sửa',
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      _buildThongTinItem(
                          'Họ tên đầy đủ', controller.hovatenController.text),
                      _buildThongTinItem(
                          'Ngày Sinh', controller.ngaySinhController.text),
                      _buildThongTinItem(
                          'Số điện thoại', controller.sdtController.text),
                      _buildThongTinItem(
                          'Email', controller.emailController.text),
                      _buildThongTinItem(
                          'Địa chỉ', controller.diachiController.text),
                      _buildThongTinItem(
                          'Giới Tính', controller.gioiTinhController.text),
                    ],
                  ),
                ),
              ));
        });
  }
}

Widget _buildThongTinItem(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 5.0),
      TextField(
        controller: TextEditingController(text: value),
        readOnly: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      // Text(
      //   value,
      //   style: TextStyle(
      //     fontSize: 14.0,
      //     color: Colors.grey[600],
      //   ),
      // ),
      const SizedBox(height: 15.0),
    ],
  );
}

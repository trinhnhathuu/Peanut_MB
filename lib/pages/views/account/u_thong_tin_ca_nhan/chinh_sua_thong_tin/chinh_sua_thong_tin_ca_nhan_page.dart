import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/basewidget/text_field_custom.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../../../utils/images.dart';
import 'chinh_sua_thong_tin_ca_nhan_controller.dart';

class ChinhSuaThongTinCaNhanPage
    extends GetView<ChinhSuaThongTinCaNhanController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChinhSuaThongTinCaNhanController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Chỉnh sửa thông tin cá nhân'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Center(
                  child: Container(
                    height: DeviceUtils.getScaledHeight(context, 0.14),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(Images
                              .anh_test), // Thay bằng đường dẫn ảnh của bạn
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: () {
                            controller.getAnh();
                            controller.update();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                CustomTextField(
                  controller: controller.hovatenController,
                  prefixIcon: Icons.person_outline_rounded,
                  hintText: 'Họ tên đầy đủ',
                  hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                ),
                _buildDivider(),
                CustomTextField(
                  controller: controller.ngaySinhController,
                  prefixIcon: Icons.cake_outlined,
                  hintText: 'Ngày sinh',
                  hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                ),
                _buildDivider(),
                CustomTextField(
                  controller: controller.sdtController,
                  prefixIcon: Icons.phone_outlined,
                  hintText: 'Số điện thoại',
                  hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                ),
                _buildDivider(),
                CustomTextField(
                  controller: controller.emailController,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                ),
                _buildDivider(),
                CustomTextField(
                  controller: controller.diachiController,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Địa Chỉ',
                  hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                ),
                _buildDivider(),
                CustomTextField(
                  controller: controller.gioiTinhController,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Giới Tính',
                  hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                ),
               
                GestureDetector(
                  onTap: () {
                    controller.updateData();
                  },
                  child: Container(
                    alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         color: ColorPeanut.BUTTON_DONGY,

                      ),
                      width: DeviceUtils.getScaledWidth(context, 0.8),
                      height: DeviceUtils.getScaledHeight(context, 0.06),
                      child: Text('Cập Nhật')),
                )
              ]),
            ),
          );
        });
  }
}

Widget _buildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: const Divider(
      color: Colors.grey,
      height: 1,
    ),
  );
}

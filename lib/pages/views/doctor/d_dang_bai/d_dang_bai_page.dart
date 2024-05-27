
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/doctor/d_dang_bai/d_dang_bai_controller.dart';

import '../../../../utils/color_peanut.dart';
import '../../../../utils/demensions.dart';
import '../../../../utils/device_utils.dart';
import '../../../../utils/images.dart';

class DDangBaiPage extends GetView<DDangBaiController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
        init: DDangBaiController(),
        builder: (controller){
          if(controller.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child:  Text(
                  'Tạo bài đăng',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: ColorPeanut.APPBAR_BACKGROUND,
            ),
            floatingActionButton: GestureDetector(
              onTap: () {
                controller.dangBai();
              },
              child: Container(
                alignment: Alignment.center,
                height: DeviceUtils.getScaledHeight(context, 0.05),
                width: DeviceUtils.getScaledWidth(context, 0.4),
                decoration: BoxDecoration(
                    color: ColorPeanut.BUTTON_DONGY,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Text('Đăng bài'),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 0.1),
                        height: DeviceUtils.getScaledHeight(context, 0.1),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(Images.anh_test),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 0.8),
                        child: Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.vertical,
                          children: [
                            
                            Text(
                              controller.taiKhoanResponse.name.toString(),
                              style: TextStyle(
                                fontSize: PDimensions.FONT_SIZE_SPAN,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                    border: InputBorder.none,
                                    hintText: 'vui lòng nhập tiêu đề',
                                    hintStyle: TextStyle(
                                        fontSize: PDimensions.FONT_SIZE_SPAN_0)),
                                style: TextStyle(
                                    fontSize: PDimensions.FONT_SIZE_SPAN_0),
                                maxLines: null,
                                controller: controller.tieuDeController,
                              ),
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                left: BorderSide(color: Colors.grey),
                              )),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Bắt đầu nhập',
                                    hintStyle: TextStyle(
                                        fontSize: PDimensions.FONT_SIZE_SPAN_1,
                                        fontWeight: FontWeight.w500
                                        )),
                                style: TextStyle(
                                    fontSize: PDimensions.FONT_SIZE_SPAN_1),
                                maxLines: null,
                                controller: controller.noiDungBaiDangController,
                              ),
                            ),
                            if (controller.imageUrl.isNotEmpty)
                              Obx(
                                () => Container(
                                    width:
                                        DeviceUtils.getScaledHeight(context, 1),
                                    height: DeviceUtils.getScaledHeight(
                                        context, 0.2),
                                    child: Image.network(
                                      controller.imageUrl.value,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.getAnh();
                                    },
                                    child: const Icon(
                                      Icons.image_outlined,
                                      size: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.emoji_emotions_outlined,
                                      size: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.mic,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );

        });
  }
}
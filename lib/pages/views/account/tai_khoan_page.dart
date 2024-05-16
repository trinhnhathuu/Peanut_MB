import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/account/tai_khoan_controller.dart';
import 'package:peanut_app/routes/app_routes.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../utils/color_peanut.dart';
import '../../../../utils/images.dart';

class TaiKhoanPage extends GetView<TaiKhoanController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TaiKhoanController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async{ 
              return await Future.delayed(const Duration(seconds: 2));
             },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorPeanut.APPBAR_BACKGROUND,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: DeviceUtils.getScaledHeight(context, 0.14),
                      child: Stack(
                        children: [
                          Container(
                            height: DeviceUtils.getScaledHeight(context, 0.07),
                            color: ColorPeanut.APPBAR_BACKGROUND,
                          ),
                          Positioned(
                            child: Center(
                              child: Container(
                                width: DeviceUtils.getScaledWidth(context, 0.35),
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.15),
                                decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          '${controller.taiKhoanResponse.avatar != null ? controller.taiKhoanResponse.avatar :  Images.anh_test}',
                                         ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                    Text(
                      controller.taiKhoanResponse.name == "null" ?  controller.taiKhoanResponse.email.toString() : controller.taiKhoanResponse.name.toString(),
                      style: TextStyle(
                          fontSize: PDimensions.FONT_SIZE_H6,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: PDimensions.SPACE_SIZE_3X),
                    Column(
                      children: [
                        _buildMenuItem(
                            context: context,
                            img: Images.icon_thong_tin_ca_nhan,
                            title: 'Thông tin cá nhân',
                            onTap: () {
                              Get.toNamed(AppRoutes.THONG_TIN_CA_NHAN);
                            }),
                        _buildDivider(),
                        _buildMenuItem(
                            context: context,
                            img: Images.icon_thong_tin_suc_khoe,
                            title: 'Thông tin sức khỏe',
                            onTap: () {
                              print('test hàm');
                            }),
                        _buildDivider(),
                        _buildMenuItem(
                            context: context,
                            img: Images.icon_bai_viet,
                            title: 'Bài Viết',
                            onTap: () {
                              print('test hàm');
                            }),
                        _buildDivider(),
                        _buildMenuItem(
                            context: context,
                            img: Images.icon_dang_ky_bac_si,
                            title: 'Đăng ký Bác Sĩ',
                            onTap: () {
                              Get.toNamed(AppRoutes.DANG_KY_BAC_SI);
                            }),
                        _buildDivider(),
                        _buildMenuItem(
                            context: context,
                            img: Images.icon_dang_xuat,
                            title: 'Đăng xuất',
                            onTap: () {
                              print('test hàm');
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildMenuItem(
      {required BuildContext context,
      required String img,
      required String title,
      required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              img,
              width: DeviceUtils.getScaledWidth(context, 0.05),
            ),
            const SizedBox(width: 15),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      height: 1,
    );
  }
}

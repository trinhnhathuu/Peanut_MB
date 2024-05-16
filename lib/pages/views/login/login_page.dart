import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/login/login_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/images.dart';

import '../../../utils/demensions.dart';
import '../../../utils/device_utils.dart';

class LoginPage extends GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
        init:LoginController(),
        builder: (controller){
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Center(
                      child: Image.asset(Images.logo_peanut,
                      width: DeviceUtils.getScaledSize(context, 0.7),
                     ),
                    ),
               Container(
                 alignment: Alignment.center,
                 width: DeviceUtils.getScaledWidth(context, 0.9),
                 child: Flex(
                   direction: Axis.vertical,
                    children: [
                      if(!controller.taiKhoan)
                      TextField(
                        controller: controller.hoTen,
                        decoration: InputDecoration(
                            isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          suffixIcon: const Icon(Icons.person_2_outlined),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          label:const Text('Họ và Tên'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.email,
                        decoration: InputDecoration(
                            isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          suffixIcon: const Icon(Icons.email_outlined),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          label: const Text('Email'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.matKhau,
                        obscureText: controller.isObscure,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          suffixIcon:controller.showPassWord(),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          label:const Text('Mật Khẩu'),
                        ),
                      ),
                      if(!controller.taiKhoan)
                        Container(
                          margin: EdgeInsets.only(top:5, bottom: 5),
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            child: const Text(
                              'Quên mật khẩu ?'
                            ),
                          ),
                        )
                    ],
                 ),
               ),
                Flex(
                  direction: Axis.vertical,
                  children:[
                    GestureDetector(
                      onTap: (){
                        print('test');
                        controller.dangKyTaiKhoan();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top:PDimensions.SPACE_SIZE_1X, bottom: PDimensions.SPACE_SIZE_1X,),
                        alignment: Alignment.center,
                        height: DeviceUtils.getScaledHeight(context, 0.06),
                        width: DeviceUtils.getScaledWidth(context, 0.9),
                        decoration: BoxDecoration(
                          color: ColorPeanut.BUTTON_DONGY,
                          borderRadius: BorderRadius.circular(PDimensions.BORDER_RADIUS_2X)
                        ),
                        child:
                        Text(
                            controller.taiKhoan ? 'Đăng Nhập' : ' Đăng Ký'
                              ,style: TextStyle(
                              fontSize: PDimensions.FONT_SIZE_H5
                            ),
                          ),

                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:PDimensions.SPACE_SIZE_1X, bottom: PDimensions.SPACE_SIZE_1X,),
                      child: Flex(
                          mainAxisAlignment: MainAxisAlignment.center,
                          direction: Axis.horizontal,
                          children: [
                            Text(controller.taiKhoan ?
                                'Bạn chưa có tài khoản'
                                :' Bạn đã có tài khoản ?'),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.taiKhoan = !controller.taiKhoan;
                                controller.update();
                              },
                              child:  Text(
                               controller.taiKhoan ?'Đăng Ký'  :'Đăng Nhập',
                                style: const TextStyle(
                                  color: ColorPeanut.TEXT_NOI_BAT
                                ),
                              ),
                            )
                          ],
                                       ),
                    )

                  ]
                ),
                SizedBox(
                  height: DeviceUtils.getScaledHeight(context, 0.1),
                  child:const Center(
                      child: Text('OR'),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top:PDimensions.SPACE_SIZE_1X, bottom: PDimensions.SPACE_SIZE_1X,),
                    alignment: Alignment.center,
                    height: DeviceUtils.getScaledHeight(context, 0.06),
                    width: DeviceUtils.getScaledWidth(context, 0.9),
                    decoration: BoxDecoration(
                        border: Border.all(color:ColorPeanut.BUTTON_DONGY ) ,
                        borderRadius: BorderRadius.circular(PDimensions.BORDER_RADIUS_2X)
                    ),
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: Axis.horizontal,
                    children: [
                      Image.asset(Images.gg_logo,
                        fit: BoxFit.fill,
                        width: DeviceUtils.getScaledWidth(context, 0.06),
                      ),
                      GestureDetector(
                        onTap: (){
                        },
                        child: Text(' Đăng nhập bằng Google'))
                    ],),
                  )
                  ,
                ),
               
              ],
            ),
          );
        });
  }

}
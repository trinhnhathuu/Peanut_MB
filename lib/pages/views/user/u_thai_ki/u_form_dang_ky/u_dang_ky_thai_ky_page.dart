
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/u_thai_ki/u_form_dang_ky/u_dang_ky_thai_ky_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../../utils/images.dart';

class DangKyThaiKyFormPage extends GetView<DangKyThaiKyFormController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
      init: DangKyThaiKyFormController(),
        builder: (controller){
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Tạo hồ sơ')),
        ),
        body:SingleChildScrollView(
          child: Container(
            width: DeviceUtils.getScaledWidth(context, 1),
            margin:EdgeInsets.all(PDimensions.SPACE_SIZE_1X),
            child: Column(
              children: [
                Container(
                  height: DeviceUtils.getScaledHeight(context, 0.1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: ColorPeanut.ICON_DASH_BOARD)
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Image.asset(Images.theo_doi_thai_ky,
                        height: DeviceUtils.getScaledHeight(context, 0.1),
                        width: DeviceUtils.getScaledWidth(context, 0.1),
                      ),
                      SizedBox(width: 10,),
                      Text('Theo dõi thai kỳ'),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: PDimensions.SPACE_SIZE_11X, bottom: PDimensions.SPACE_SIZE_11X),
                    height: DeviceUtils.getScaledHeight(context, 0.15),
                    width: DeviceUtils.getScaledWidth(context, 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person,
                      size: DeviceUtils.getScaledSize(context, 0.12),),
                    ),
                  ),
                ),
              // SizedBox(height: PDimensions.SPACE_SIZE_11X,),
              Container(
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  direction: Axis.vertical,
                  children: [
                    Text('Ngày dự sinh'),
                    SizedBox(height: PDimensions.SPACE_SIZE_1X,),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon:Image.asset(Images.ngay_du_sinh,
                          width: 5,
                          height: 5,
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Vui lòng chọn ngày dự sinh',
                      ),
                    ),
                    SizedBox(height: PDimensions.SPACE_SIZE_5X,),
                    Text('Hoặc'),
                    SizedBox(height: PDimensions.SPACE_SIZE_5X,),
                    Flex(direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tuần thai'),
                      SizedBox(height: PDimensions.SPACE_SIZE_1X,),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Vui lòng nhập số tuần',
                        ),
                      ),
                    ],),

                  ],
                ),
              ),
                SizedBox(height: PDimensions.SPACE_SIZE_11X,),
                GestureDetector(
                  onTap: (){
                    controller.submitForm();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorPeanut.BUTTON_DONGY,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    height: DeviceUtils.getScaledHeight(context, 0.07),
                    width: DeviceUtils.getScaledWidth(context, 0.6),
                    child: Text('Hoàn Thành', style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ) ,
      );
    });
  }

}
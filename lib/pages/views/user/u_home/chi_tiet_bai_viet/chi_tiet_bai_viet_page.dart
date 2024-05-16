
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/u_home/chi_tiet_bai_viet/chi_tiet_bai_viet_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../../utils/images.dart';

class ChiTietBaiVietPage extends GetView<ChiTietBaiVietController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChiTietBaiVietController(),
        builder: (builder){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPeanut.APPBAR_BACKGROUND,
              title: Text(builder.title),
              automaticallyImplyLeading: true,
              leading: GestureDetector(
                onTap: (){
                  Get.back();
                  print('cjecl');
                },
                  child: Icon(Icons.arrow_back_ios_sharp)),
            ),
            body: Container(

              width: DeviceUtils.getScaledWidth(context, 0.9),
              margin: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(controller.posterResponse.image != '')
                    Image.network(controller.posterResponse.image.toString()),
                  Text('${controller.posterResponse.title}',
                    softWrap: true,
                  ),
                  Text('${controller.posterResponse.content}',
                    softWrap: true,
                  ),
                 
                    Flex(direction: Axis.vertical,
                    children: [
                      Row(
                        children: [
                          Image.asset(Images.icon_news,
                            width: PDimensions.FONT_SIZE_H5,
                            height: PDimensions.FONT_SIZE_H5,
                          ),
                          Text('Tin tức liên quan',
                            style: TextStyle(fontSize: PDimensions.FONT_SIZE_H5),
                          )
                        ],
                      )
                    ],),
                    Container(
                      width: DeviceUtils.getScaledWidth(context, 1),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext conext, index){
                            return Container(

                              margin: EdgeInsets.all(PDimensions.SPACE_SIZE_1X),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child:Flex(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                direction: Axis.horizontal,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    height: DeviceUtils.getScaledHeight(context, 0.2),
                                    child: Flex(direction: Axis.vertical,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [Text('Ngủ ngon làm như thế nào'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(Images.anh_test,),
                                            ),
                                          ),
                                          Text('quynhnga'),
                                        ],
                                      )],),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),

                                    height: DeviceUtils.getScaledHeight(context, 0.2),
                                    child: Flex(
                                      direction: Axis.vertical,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                          Icon(Icons.more_horiz_rounded),
                                        Container(
                                          color: Colors.red,
                                          width:50,
                                          height: 50,
                                          child: Image.asset(Images.anh_test,
                                          width:50,
                                          height: 50,
                                          ),
                                        ),
                                        Text('16 giờ')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
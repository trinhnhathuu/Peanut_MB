import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/u_thai_ki/u_thai_ky_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/date_converter.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../utils/images.dart';

class ThaiKyPage extends GetView<ThaiKyController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
        init: ThaiKyController(),
        builder: (controller) {
          if(controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPeanut.APPBAR_BACKGROUND,
              title: const Text(
                "Theo dõi thai kỳ",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            floatingActionButton:Container(
              alignment: Alignment.bottomRight,
              child:  Image.asset(Images.anh_trang_tri_man_hinh_thai_ky,
              width: DeviceUtils.getScaledWidth(context, 0.3),
              ),
            ),
            body:  Container(
                width: DeviceUtils.getScaledWidth(context, 1),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: DeviceUtils.getScaledHeight(context, 0.1),
                        child: Stack(
                          children: [
                            Container(
                              height: DeviceUtils.getScaledHeight(context, 0.04),
                              color: ColorPeanut.APPBAR_BACKGROUND,
                            ),
                            Positioned(
                                child: Center(
                              child: Container(
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.12),
                                width: DeviceUtils.getScaledWidth(context, 0.9),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0)),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: PDimensions.SPACE_SIZE_11X),
                                      Container(
                                        height: DeviceUtils.getScaledHeight(
                                            context, 0.1),
                                        width: DeviceUtils.getScaledWidth(
                                            context, 0.1),
                                        child: Image.asset(Images.tuan_thai),
                                      ),
                                      SizedBox(width: PDimensions.SPACE_SIZE_1X),
                                      Flex(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       direction: Axis.vertical,children: [
                                       Text(
                                           'Tuần thai thứ ${controller.pregnancyGuideResponse.week}',
                                       ),
                                       Text(
                                         'ngày dự sinh ${DateConverter.formattedDateLocalFull(controller.pregnancyResponse.dueDate.toString())}',
                                         style: TextStyle(
                                           fontSize:PDimensions.FONT_SIZE_SPAN_0,
                                           color: ColorPeanut.TEXT_NOI_BAT,
                                         ),
              
                                       ),
                                      SizedBox(width: PDimensions.SPACE_SIZE_1X),
              
                                     ],)
                                    ],
                                  ),
              
                              ),
                            ))
                          ],
                        ),
                      ),
                SizedBox(height: PDimensions.SPACE_SIZE_2X),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                                                  color: Colors.white,

                        ),
                        width:DeviceUtils.getScaledWidth(context, 0.8) ,
                        child: DefaultTabController(
                          length: 3,
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              TabBar(
                                unselectedLabelColor: ColorPeanut.TEXT_NOI_BAT,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorWeight : 20,
                                indicator: const BoxDecoration(
                                  color: ColorPeanut.APPBAR_BACKGROUND,
                                ),
                                tabs: [
                                  Container(
                                    child: const Text('Thai Nhi')),
                                  
                                   const Text('Mẹ bầu'),
                                  
                                   const Text('Chú ý'),
                                  
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width:DeviceUtils.getScaledWidth(context, 0.8) ,
                                height: DeviceUtils.getScaledWidth(context, 0.5),
                                child: Container(
                                 margin: EdgeInsets.only(top: PDimensions.SPACE_SIZE_1X),
                                  alignment: Alignment.center,
                                  width: DeviceUtils.getScaledWidth(context, 0.6),
                                  child: TabBarView(
                                    children: [
                                    Text(controller.pregnancyGuideResponse.pregnancyInfo.toString(),),
                                     Text(controller.pregnancyGuideResponse.doctorAdvice.toString()),
                                     Text(controller.pregnancyGuideResponse.notes.toString())
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: PDimensions.SPACE_SIZE_2X),
                      Container(
                        width:DeviceUtils.getScaledWidth(context, 1) ,
                        height:DeviceUtils.getScaledWidth(context, 0.1) ,
                        color: ColorPeanut.APPBAR_BACKGROUND,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset(Images.anh_lich_theo_doi_thai_ky,
                            width: DeviceUtils.getScaledWidth(context, 0.2),
                            height:DeviceUtils.getScaledWidth(context, 0.3) ,
                          ),
                            Text(
                              'Theo dõi thai kỳ',
                              style: TextStyle(color: Colors.white, fontSize: PDimensions.FONT_SIZE_H3),
                            )
                          ],
                        ),
                      )
                      
                    ],
                  ),
                ),
              ),
            
          );
        });
  }
}

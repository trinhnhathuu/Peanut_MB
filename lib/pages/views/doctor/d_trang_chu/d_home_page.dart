import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/doctor/d_trang_chu/d_home_page_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/device_utils.dart';
import 'package:peanut_app/utils/images.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/demensions.dart';

class DHomePage extends GetView<DHomePageController> {
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
        init: DHomePageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Flex(
                direction: Axis.vertical,
                children: [
                  Text(
                    'Xin Chào',
                    style: TextStyle(fontSize: PDimensions.FONT_SIZE_H5),
                  ),
                   Text(controller.taiKhoanResponse.name.toString(),
                      style: TextStyle(
                        fontSize: PDimensions.FONT_SIZE_H5,
                      ))
                ],
              ),
              actions: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: DeviceUtils.getScaledHeight(context, 0.05),
                  width: DeviceUtils.getScaledHeight(context, 0.06),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                )
              ],
              backgroundColor: ColorPeanut.APPBAR_BACKGROUND,
            ),
            body: Container(
              margin: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Image.asset(
                          Images.icon_news,
                          width: PDimensions.FONT_SIZE_H4,
                          height: PDimensions.FONT_SIZE_H4,
                        ),
                        Text('Tin tức y tế',
                            style: TextStyle(
                              fontSize: PDimensions.FONT_SIZE_H5,
                            )),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.toNamed(AppRoutes.U_CHI_TIET_BAI_VIET);
                      },
                      child: Container(
                        height: DeviceUtils.getScaledHeight(context, 0.21),
                        
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.07),
                                width:
                                    DeviceUtils.getScaledHeight(context, 0.4),
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  direction: Axis.vertical,
                                  children: [
                                    Container(
                                      height: DeviceUtils.getScaledHeight(
                                          context, 0.12),
                                      width: DeviceUtils.getScaledHeight(
                                          context, 1),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(Images.anh_test),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Text(
                                        '8 bí quyết đơn giản mẹ nào cũng làm được để sinh con thông minh ${index}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: PDimensions.FONT_SIZE_SPAN,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Flex(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        direction: Axis.horizontal,
                                        children: [
                                          Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(10.0),
                                                    image:
                                                        const DecorationImage(
                                                            image: AssetImage(
                                                                Images
                                                                    .anh_test),
                                                            fit: BoxFit.cover)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                               Text('Nguyễn Thanh Tùng',
                                                  style: TextStyle(
                                                    fontSize: PDimensions.FONT_SIZE_SPAN_0,
                                                  ))
                                            ],
                                          ),
                                           Text('Ngày 12/1/2024', style: TextStyle(
                                                    fontSize: PDimensions.FONT_SIZE_SPAN_0,
                                                  ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Image.asset(
                          Images.icon_news_public,
                          width: PDimensions.FONT_SIZE_H4,
                          height: PDimensions.FONT_SIZE_H4,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('Bảng tin cộng đồng',
                            style: TextStyle(
                              fontSize: PDimensions.FONT_SIZE_H5,
                            )),
                      ],
                    ),
                    Container(
                      width: DeviceUtils.getScaledWidth(context, 1),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.listPoster.length,
                          itemBuilder: (BuildContext conext, index) {
                            return GestureDetector(
                              onTap:(){
                                controller.toPosterDetail(controller.listPoster[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.all(PDimensions.SPACE_SIZE_1X),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    Container(
                                      width: DeviceUtils.getScaledWidth(
                                          Get.context!, 0.1),
                                      height: DeviceUtils.getScaledHeight(
                                          Get.context!, 0.05),
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                          Images.anh_test,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: DeviceUtils.getScaledWidth(
                                          context, 0.7),
                                      child: Flex(
                                        direction: Axis.vertical,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(controller.listPoster[index].userId!.name.toString(),
                                                  style: TextStyle(
                                                    fontSize: PDimensions.FONT_SIZE_H6,
                                                  )),
                                              Flex(
                                                direction: Axis.horizontal,
                                                children: [
                                                  Text('16 giờ', style: TextStyle(
                                                    fontSize: PDimensions.FONT_DEFAULT,
                                                  )),
                                                  SizedBox(width: 5,),
                                                  Icon(Icons.more_horiz_rounded,size: PDimensions.FONT_SIZE_H5,)
                                                ],
                                              )
                                            ],
                                          ),
                                          if(controller.listPoster[index].image != '')
                                          Container(
                                            height: DeviceUtils.getScaledHeight(context, 0.09),
                                            child: Image.network(controller.listPoster[index].image.toString(),fit: BoxFit.cover,),
                                          ),
                                          SizedBox(
                                            child: Text(controller.listPoster[index].title.toString()),
                                          ),
                                          Container(
                                              width: DeviceUtils.getScaledWidth(
                                                  context, 0.7),
                                              child:  Text(
                                                '       ${controller.listPoster[index].content.toString()}',
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                               
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontSize: PDimensions.FONT_SIZE_SPAN,
                                                ),
                                              )),
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            child:  Icon(
                                                Icons.favorite_border_outlined,
                                                size: PDimensions.FONT_SIZE_SPAN,),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
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

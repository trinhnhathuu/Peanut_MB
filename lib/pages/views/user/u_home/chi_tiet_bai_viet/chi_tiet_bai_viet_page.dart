
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/user/u_home/chi_tiet_bai_viet/chi_tiet_bai_viet_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../../utils/date_converter.dart';
import '../../../../../utils/images.dart';
import '../../../../basewidget/text_field_custom.dart';

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
                  child: const Icon(Icons.arrow_back_ios_sharp)),
            ),
            body: Container(

              width: DeviceUtils.getScaledWidth(context, 1),
              margin: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(controller.posterResponse.image != '')
                    Image.network(controller.posterResponse.image.toString()),
                  Text('${controller.posterResponse.title}',
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  Text('${controller.posterResponse.content}',
                    softWrap: true,
                  ),
                    // )
                    const Divider(
                      thickness: 1.0,
                    ),
                    CustomTextField(
                      controller:controller.contentController,
                      maxLines: 3,
                      hintText: 'Bình luận',
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: (){
                          controller.addComment();
                        },
                        child: const Text('Gửi'),
                      )
                    ),

                    // hiển thị list comment
                    Container(
                      width: DeviceUtils.getScaledWidth(context, 1),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.listComment.length,
                          itemBuilder: (BuildContext context, index){
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: DeviceUtils.getScaledWidth(context, 0.8),
                                    child: Flex(
                                      direction: Axis.vertical,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flex(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          direction: Axis.horizontal, children: [
                                          Text(controller.listComment[index].userId!.name.toString()),
                                          Text(DateConverter.formattedDateLocalFull(controller.listComment[index].createdAt.toString())),
                                        ]),
                                        
                                        Text(controller.listComment[index].content.toString()),

                                       
                                      ],
                                    ),
                                  ),

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
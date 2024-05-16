import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/basewidget/googleMap/tim_kiem_vi_tri/tim_kiem_vi_tri_controller.dart';
import 'package:peanut_app/utils/demensions.dart';

import '../../../../../../utils/device_utils.dart';

class TimKiemViTriCuThePage extends GetView<TimKiemViTriCuTheController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimKiemViTriCuTheController>(
        init: TimKiemViTriCuTheController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Chọn vị trí'),
            ),
            body: IntrinsicHeight(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: DeviceUtils.getScaledHeight(context, 0.1),
                      padding:  EdgeInsets.only(
                        right:PDimensions.SPACE_SIZE_2X,
                        left: PDimensions.SPACE_SIZE_2X,
                        top: PDimensions.SPACE_SIZE_2X,
                        bottom: 0,
                      ),
                      child: TextField(
                        onSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                        },
                        controller: controller.diaChiTimKiemController,
                        onChanged: (value) {
                          value = controller.diaChiTimKiemController.text;
                          controller.diaChiTimKiem(
                              controller.diaChiTimKiemController.value.text);
                          controller.update();
                        },
                        decoration: InputDecoration(
                          isDense: true,
                            hintText: 'Nhập địa chỉ',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                controller.diaChiTimKiemController.clear();
                                controller.update();
                              },
                            ),
                            prefixIcon: IconButton(
                              icon:  const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                controller.diaChiTimKiem(
                                    controller.diaChiTimKiemController.text);
                                controller.update();
                              },
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    if (controller.listViTri.isEmpty)
                      const SizedBox()
                    else
                      Container(
                        height:
                            DeviceUtils.getScaledHeight(context, (1 - 0.1)),
                        padding:  EdgeInsets.symmetric(
                          horizontal: PDimensions.SPACE_SIZE_2X,
                        ),
                        child: ListView.builder(
                          itemCount: controller.listViTri.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(controller.listViTri[index]
                                      ['description']
                                  .toString()),
                              onTap: () {
                                controller.onSearchResultSelected(controller
                                    .listViTri[index]['description']
                                    .toString());
                                controller.getLatLng(controller.listViTri[index]
                                        ['place_id']
                                    .toString());
                                controller.update();
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

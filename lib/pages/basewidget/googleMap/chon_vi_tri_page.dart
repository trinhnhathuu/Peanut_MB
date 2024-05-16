import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/device_utils.dart';
import 'chon-vi_tri_controller.dart';

class ChonViTriPage extends GetView<ChonViTriController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChonViTriController>(
        init: ChonViTriController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Chọn vị trí'),
              centerTitle:true,
            ),
            body: Stack(
              children: [
                SizedBox(
                  child: FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      center:
                          // (controller.lat != 0 && controller.lng != 0)?
                          LatLng(controller.lat!, controller.lng!),
                      // : LatLng(16.034440, 108.219880),
                      zoom:
                          (controller.diaChiTimKiemController.text != '') ? 15 : 10,
                      maxZoom: 18,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://api.mapbox.com/styles/v1/nhathuu02/clvzbdtod02a701qr65nt7mxb/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibmhhdGh1dTAyIiwiYSI6ImNsdnphd2F3ZjMwNzcybXJybjl4dG1yZHkifQ.lb-TFZp0Wj4VskXxuwpf9g',
                        additionalOptions: const {
                          'accessToken':
                              'pk.eyJ1IjoibmhhdGh1dTAyIiwiYSI6ImNsdnphd2F3ZjMwNzcybXJybjl4dG1yZHkifQ.lb-TFZp0Wj4VskXxuwpf9g',
                          'id': 'mapbox.mapbox-streets-v8'
                        },
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          if(controller.diaChiTimKiemController.text != null && controller.diaChiTimKiemController.text != '')
                          Marker(
                            point: LatLng(controller.lat!, controller.lng!),
                            width: 20,
                            height: 20,
                            child:const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 30,
                              )
                            
                          ),
                        ],
                      ),
                      PolygonLayer(
                        polygons: [
                          Polygon(
                            label: 'Quần đảo Hoàng Sa',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            points: [
                              LatLng(11.016986, 115.188117),
                              LatLng(11.099294, 116.458069),
                              LatLng(10.416632, 116.458069),
                              LatLng(10.334138, 115.176136)
                            ],
                            // color: Color(0xffAAD3DF),
                            // isFilled: true,
                          ),
                        ],
                      ),
                      PolygonLayer(
                        polygons: [
                          Polygon(
                            label: 'Quần đảo Hoàng Sa',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            points: [
                              LatLng(17.601961, 110.847664),
                              LatLng(17.115571, 113.070903),
                              LatLng(15.243460, 113.349086),
                              LatLng(15.577679, 110.758463)
                            ],
                            // color: Color(0xffAAD3DF),
                            // isFilled: true,
                          ),
                        ],
                      ),
                    
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      if(controller.diaChiTimKiemController.text.isNotEmpty && controller.diaChiTimKiemController.text != ''){
                      controller.update();
                      controller.backDuLieuVeManHinhDangKyDinhVi();
                      }
                    },
                    child: Container(
                      width: DeviceUtils.getScaledWidth(context, 1),
                      padding:   EdgeInsets.symmetric(
                        horizontal: PDimensions.SPACE_SIZE_2X,
                        vertical:  PDimensions.SPACE_SIZE_2X,
                      ),
                      color: Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        width: DeviceUtils.getScaledWidth(context, 0.9),
                        height: DeviceUtils.getScaledHeight(context, 0.07),
                        decoration: BoxDecoration(
                          color: controller.isUpdate ? ColorPeanut.COLORS_SUCCESS : (controller.diaChiTimKiemController.text.isEmpty && controller.diaChiTimKiemController.text == '')
                              ? Colors.grey
                              : ColorPeanut.COLORS_SUCCESS,
                          borderRadius:  BorderRadius.all(
                              Radius.circular(PDimensions.SPACE_SIZE_2X)),
                        ),
                        child:  Text(
                          'Xác nhận vị trí',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: PDimensions.FONT_SIZE_SPAN_1),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding:  EdgeInsets.only(
                      right: PDimensions.SPACE_SIZE_2X,
                      left: PDimensions.SPACE_SIZE_2X,
                      top: PDimensions.SPACE_SIZE_2X,
                      bottom: 0,
                    ),
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        controller.toTimKiemViTri();
                        controller.update();
                      },
                      controller: controller.diaChiTimKiemController,
                      onChanged: (value) {
                        value = controller.diaChiTimKiemController.text;
                      },
                      decoration: InputDecoration(
                        isDense : true,
                          hintText: 'Nhập địa chỉ',
                          prefixIcon: IconButton(
                            icon:  const Icon(Icons.search,
                            color: Colors.grey,
                           
                            ),
                            onPressed: () {},
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

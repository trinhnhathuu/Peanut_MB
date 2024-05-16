import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:localstorage/localstorage.dart';

import 'tim_kiem_vi_tri/tim_kiem_vi_tri_page.dart';

class ChonViTriController extends GetxController {
  bool isLoading = true;
  TextEditingController diaChiTimKiemController = TextEditingController();
  List<dynamic> listViTri = [];
  late Dio dio;
  dynamic? locationOn;
  double? lat = 0;
  double? lng = 0;
  LocalStorage storage = LocalStorage('checkRequestPermission');
  Position? position;
  Position? currentLocation;
  dynamic? result;
  MapController mapController = MapController();
  bool isUpdate = false;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null &&
        Get.arguments[0] != 0 &&
        Get.arguments[1] != 0 &&
        Get.arguments[0] != null &&
        Get.arguments[1] != null) {
      lat = Get.arguments[0] as double;
      lng = Get.arguments[1] as double;
      if(Get.arguments[2] != ''){
      diaChiTimKiemController.text = Get.arguments[2] as String;
      isUpdate = true;
      }
    } else {
      lat = 16.4845044;
      lng = 107.6667207;
      // 16.4845044,107.6667207
      // 16.034440, 108.219880
    }
    isLoading = false;
    update();
  }
  // lấy tọa độ hiện tại 

  void toTimKiemViTri() async {
    result = await Get.to(TimKiemViTriCuThePage()) ?? '';
    if (result != null) {
      diaChiTimKiemController.text = result['diaChi'] as String;
      lat = result['lat'] as double;
      lng = result['lng'] as double;
      mapController.move(LatLng(lat!, lng!), 15);
      update();
    }
  }

  void backDuLieuVeManHinhDangKyDinhVi() {
    Get.back(result: {
      'lat': lat,
      'lng': lng,
      'diaChi': diaChiTimKiemController.text
    });
    update();
  }
}

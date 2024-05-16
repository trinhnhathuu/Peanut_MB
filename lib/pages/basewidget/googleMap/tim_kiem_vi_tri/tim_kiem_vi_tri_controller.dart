import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../../../utils/app_constants.dart';

class TimKiemViTriCuTheController extends GetxController {
  RxList<dynamic> listViTri = [].obs;
  Position? currentLocation;
  TextEditingController diaChiTimKiemController = TextEditingController();
  Dio? dio;
  dynamic? locationOn;
  double? lat = 20.981971;
  double? lng = 105.864323;
  @override
  void onInit() {
    super.onInit();
    diaDiemHienTai();
  }

  void apiConnect() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://rsapi.goong.io/Place',
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 3000),
      ),
    );
  }

  void diaDiemHienTai() async {
    currentLocation = await Geolocator.getCurrentPosition();
    lat = currentLocation!.latitude;
    lng = currentLocation!.longitude;
    update();
    apiConnect();
  }

  ///
  /// tìm kiếm vị trí theo địa chỉ nhập vào
  ///
  Future<void> getListViTri(String diaChiTimKiem) async {
    try {
      final localResponse = await dio!.get(
        '/AutoComplete?api_key=$KEY_MAP&location=$lat, $lng&input=$diaChiTimKiem&types=geocode',
        queryParameters: {
          'offset': 1,
          'limit': 10,
        },
      );
      if (localResponse.statusCode == 200) {
        listViTri.value = localResponse.data['predictions'] as List<dynamic>;
        print(listViTri);
        update();
      } else {
        debugPrint('Error: ${localResponse.statusCode}');
      }
    } catch (err) {
      print(err);
    }
  }

  // thay đổi giá trị truyền vào
  void diaChiTimKiem(String diaChiTimKiem) {
    // ignore: parameter_assignments
    diaChiTimKiem = diaChiTimKiemController.text;
    getListViTri(diaChiTimKiem);
    update();
  }

  void onSearchResultSelected(String diaChi) {
    diaChiTimKiemController.text = diaChi;
    update();
  }

  void getLatLng(String place_id) async {
    try {
      final localResponse = await dio!.get(
        '/Detail?place_id=${place_id}&api_key=${KEY_MAP}',
        queryParameters: {
          'offset': 1,
          'limit': 1,
        },
      );
      if (localResponse.statusCode == 200) {
        print(place_id);
        locationOn = localResponse.data['result']['geometry']['location'];
        lat = double.tryParse(localResponse.data['result']['geometry']
                ['location']['lat']
            .toString());
        lng = double.tryParse(localResponse.data['result']['geometry']
                ['location']['lng']
            .toString());
        getBackDuLieu(lat!, lng!);
        update();
      } else {
        debugPrint('Error: ${localResponse.statusCode}');
      }
    } catch (err) {
      print(err);
    }
  }

  void getBackDuLieu(double lat, double lng) {
    Get.back(result: {
      'lat': lat,
      'lng': lng,
      'diaChi': diaChiTimKiemController.text
    });
  }
}

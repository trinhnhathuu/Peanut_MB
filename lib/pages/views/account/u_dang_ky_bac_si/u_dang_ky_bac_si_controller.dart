import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/di_container.dart';
import 'package:peanut_app/models/request/doctor_signup_request.dart';
import 'package:peanut_app/models/response/hospitals_response.dart';
import 'package:peanut_app/models/response/provinces_response.dart';
import 'package:peanut_app/pages/basewidget/upload_image.dart';
import 'package:peanut_app/providers/doctor_signup_provider.dart';
import 'package:peanut_app/providers/hospital_provider.dart';
import 'package:peanut_app/providers/province_provider.dart';
import 'package:peanut_app/routes/app_routes.dart';

import '../../../../models/request/tai_khoan_request.dart';
import '../../../../models/response/tai_khoan_response.dart';
import '../../../../providers/tai_khoan_provider.dart';
import '../../../../sharedpref/shared_preference_helper.dart';
import '../../../../utils/app_constants.dart';
import '../../../basewidget/googleMap/chon_vi_tri_page.dart';

class DangKyBacSiController extends GetxController {
  bool isLoading = false;
  TextEditingController diaChiCuTheController = TextEditingController();
  TextEditingController hoTenController = TextEditingController();
  TextEditingController soDienThoaiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController benhVienController = TextEditingController();
  TextEditingController khoaController = TextEditingController();

  double? lng;
  double? lat;
  Position? currentLocation;

  dynamic result;
  RxString imageUrl = ''.obs;
  ImageUploader imageUploader = ImageUploader(bucketName: 'images');
  TaiKhoanProvider taiKhoanProvider = GetIt.I.get<TaiKhoanProvider>();
  TaiKhoanResponse taiKhoanResponse = TaiKhoanResponse();
  TaiKhoanRequest taiKhoanRequest = TaiKhoanRequest();
  // ProvinceResponse provinceResponse = ProvinceResponse();
  List<ProvinceResponse> provinceList = [];
  ProvinceProvider provinceProvider = GetIt.I.get<ProvinceProvider>();
  List<dynamic> imgList = [];
  List<HospitalResponse> hospitals = [];
  HospitalProvider hospitalProvider = GetIt.I.get<HospitalProvider>();
  DoctorSignUpProvider doctorSignUpProvider =
      GetIt.I.get<DoctorSignUpProvider>();
  DoctorSignUpRequest doctorSignUpRequest = DoctorSignUpRequest();
  void onInit() {
    super.onInit();
    getProvinces();
    getHospitals();
    getData();
  }

  void getData() {
    sl.get<SharedPreferenceHelper>().userId.then((value) => {
          taiKhoanProvider.findById(
              id: value!,
              onSuccess: (data) {
                taiKhoanResponse = data;
                print(data);
                diaDiemHienTai();
                isLoading = false;
                update();
              },
              onError: (onError) {
                print(onError);
              })
        });
  }

  void getProvinces() async {
    provinceProvider.getProvinces(onSuccess: (data) {
      provinceList = data;
      print(provinceList[0].toJson());
      update();
    }, onError: (err) {
      print(err);
    });
  }

  void getHospitals() async {
    hospitalProvider.getHospitals(onSuccess: (data) {
      hospitals = data;
      print(hospitals[0].toJson());
      update();
    }, onError: (err) {
      print(err);
    });
  }

  void getAnh() async {
    String? imageUrlValue = await imageUploader.uploadImage();
    if (imageUrlValue != null) {
      imageUrl.value = imageUrlValue;
      imgList.add(imageUrl.value);
    }
    update();
  }

  void diaDiemHienTai() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = currentLocation!.latitude;
    lng = currentLocation!.longitude;
    update();
  }

  void toManHinhBanDo() {
    Future.delayed(Duration.zero, () async {
      if (Get.arguments != null) {
        result = await Get.to(ChonViTriPage(),
                arguments: [lat, lng, diaChiCuTheController.text]) ??
            '';
      } else {
        if (diaChiCuTheController.text.isEmpty) {
          diaDiemHienTai();
          result =
              await Get.to(ChonViTriPage(), arguments: [lat, lng, '']) ?? Null;
        } else {
          result = await Get.to(ChonViTriPage(),
                  arguments: [lat, lng, diaChiCuTheController.text]) ??
              '';
        }
      }
      if (result != null) {
        diaChiCuTheController.text = result['diaChi'] as String;
        lat = result['lat'] as double;
        lng = result['lng'] as double;
        print(lat);
        print(lng);
        update();
      }
    });
  }

  void dangKyBacSi() {
    taiKhoanResponse.role!.add(ROLE_DOCTOR);
    taiKhoanRequest.id = taiKhoanResponse.id;
    taiKhoanRequest.role = taiKhoanResponse.role;
    doctorSignUpRequest.userId = taiKhoanResponse.id;
    doctorSignUpRequest.fullName = hoTenController.text;
    doctorSignUpRequest.phoneWork = soDienThoaiController.text;
    doctorSignUpRequest.emailWork = emailController.text;
    doctorSignUpRequest.hospitalName = benhVienController.text;
    doctorSignUpRequest.appointment = khoaController.text;
    doctorSignUpRequest.hospitalAddress = diaChiCuTheController.text;
    doctorSignUpRequest.imageCard = imgList;
    doctorSignUpRequest.lat = lat;
    doctorSignUpRequest.lng = lng;
    doctorSignUpProvider.create(
        doctorSignUpRequest: doctorSignUpRequest,
        onSuccess: (data) {
          taiKhoanProvider.updateUsers(
              data: taiKhoanRequest,
              onSuccess: (data) {
                print(data);
              },
              onError: (error) {});
          update();
          Get.offAllNamed(AppRoutes.U_DASHBOARD);
          Get.snackbar(
            'Thống báo',
            'Đăng ký tài khoản bác sĩ thành công ',
          );
        },
        onError: (onError) {
          print(onError);
        });
  }
}

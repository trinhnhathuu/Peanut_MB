import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:peanut_app/di_container.dart';
import 'package:peanut_app/models/response/doctor_resopnse.dart';
import 'package:peanut_app/models/response/hospitals_response.dart';
import 'package:peanut_app/providers/appointment_provider.dart';
import 'package:peanut_app/providers/province_provider.dart';
import 'package:peanut_app/routes/app_routes.dart';
import 'package:peanut_app/sharedpref/shared_preference_helper.dart';

import '../../../../../models/request/appointment_resquest.dart';
import '../../../../../models/response/provinces_response.dart';
import '../../../../../providers/doctor_signup_provider.dart';
import '../../../../../providers/hospital_provider.dart';

class UDangKyLichHenController extends GetxController {
  bool isLoading = false;
  bool isMale = false;
  List<ProvinceResponse> provinces = [];
  ProvinceProvider provinceProvider = GetIt.I.get<ProvinceProvider>();
  List<dynamic> imgList = [];
  List<HospitalResponse> hospitals = [];
  HospitalProvider hospitalProvider = GetIt.I.get<HospitalProvider>();
  DoctorSignUpProvider doctorSignUpProvider =
      GetIt.I.get<DoctorSignUpProvider>();
  DoctorResponse? selectedDoctor;
  HospitalResponse? selectedHospital;
  ProvinceResponse? selectedProvince;
  List<DoctorResponse> doctors = [];
  AppointmentRequest appointmentRequest = AppointmentRequest();
  AppointmentProvider appointmentProvider = GetIt.I.get<AppointmentProvider>();

// list những bệnh viện nổi tiếng ở việt nam

  TextEditingController ngayHenController = TextEditingController();
  TextEditingController thoiGianCuTheController = TextEditingController();
  TextEditingController lyDoThamKhamController = TextEditingController();
  TextEditingController hovaTenController = TextEditingController();
  TextEditingController soDienThoaiController = TextEditingController();
  TextEditingController ngaySinhController = TextEditingController();

  // viết hàm showDatepicker và gán giá trị cho ngayHenController
  String userId = '';
  @override
  void onInit() {
    getProvinces();
    getUser();
  }

  // String showDatepicker(BuildContext context, {String? date}) {
  //   showDatePicker(
  //     locale: Locale('vi', 'VN'),
  //     context: context,
  //     initialDate: DateTime.now(),
  //     // năm 1990 đến năm hiện tại
  //     firstDate: DateTime(1990),
  //     lastDate: DateTime.now().add(Duration(days: 365)),
  //   ).then((value) {
  //     date = DateFormat('dd/MM/yyyy').format(value!);
  //     update();
  //     return date!;
  //   });
  //   return date!;
  // }
  void showDatepicker(BuildContext context, TextEditingController controller) {
  showDatePicker(
    locale: Locale('vi', 'VN'),
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime.now().add(Duration(days: 365)),
  ).then((value) {
    if (value != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(value);
      controller.text = formattedDate;
    }
  });
}

void showTimePickerDialog(BuildContext context, TextEditingController controller) {
  showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  ).then((time) {
    if (time != null) {
      final now = DateTime.now();
      final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      String formattedTime = DateFormat('HH:mm').format(dateTime);
      controller.text = formattedTime;
    }
  });
}

  void getUser() {
    sl<SharedPreferenceHelper>().userId.then((value) {
      userId = value!;
      print(userId);
      update();
    });
  }

  void getProvinces() async {
    provinceProvider.getProvinces(onSuccess: (data) {
      provinces = data;
      print(provinces[0].toJson());
      update();
    }, onError: (err) {
      print(err);
    });
  }

  void onchangeProvince(ProvinceResponse province) {
    selectedProvince = province;
    getHospitals(province.code.toString());
    update();
  }

  void onChangeHospital(HospitalResponse hospital) {
    selectedHospital = hospital;
    getDoctor(hospital.id.toString());
    update();
  }

  void getHospitals(String code) async {
    hospitals.clear();
    hospitalProvider.getHospitalsByProvinceCode(
        code: code,
        onSuccess: (data) {
          hospitals = data;
          update();
        },
        onError: (err) {});
  }

  void getDoctor(String id) {
    doctors.clear();
    doctorSignUpProvider.getDoctorByHospital(
        idHospital: id,
        onSuccess: (onSuccess) {
          doctors = onSuccess;
          print(doctors[0].toJson());
          update();
        },
        onError: (onError) {});
  }

  void dangKyLichHen() {
    if (isMale) {
      appointmentRequest.gender = '1'; // 1 là nam
    } else {
      appointmentRequest.gender = '0'; // 0 là nữ
    }
    appointmentRequest.userId = userId;
    appointmentRequest.doctorId = selectedDoctor!.id.toString();
    appointmentRequest.date = ngayHenController.text;
    appointmentRequest.time = thoiGianCuTheController.text;
    appointmentRequest.idHospital = selectedHospital!.id.toString();
    appointmentRequest.idProvince = selectedProvince!.id.toString();
    appointmentRequest.description = lyDoThamKhamController.text;
    appointmentRequest.phone = soDienThoaiController.text;
    appointmentRequest.name = hovaTenController.text;
    appointmentRequest.birthday = ngaySinhController.text;
    appointmentRequest.status = '1';

    appointmentProvider.create(
        data: appointmentRequest,
        onSuccess: (onSuccess) {
          print(onSuccess.toJson());
          Get.offAllNamed(AppRoutes.U_DASHBOARD);
          update();
        },
        onError: (err) {});
  }
}

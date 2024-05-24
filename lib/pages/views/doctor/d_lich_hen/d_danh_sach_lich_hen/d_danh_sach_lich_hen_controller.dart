import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/di_container.dart';
import 'package:peanut_app/models/response/appointment_response.dart';
import 'package:peanut_app/models/response/doctor_resopnse.dart';
import 'package:peanut_app/providers/appointment_provider.dart';
import 'package:peanut_app/providers/doctor_signup_provider.dart';

import '../../../../../sharedpref/shared_preference_helper.dart';

class DDanhSachLichHenController extends GetxController {
  bool isLoading = true;
  AppointmentResponse appointmentResponse = AppointmentResponse();
  AppointmentProvider appointmentProvider = GetIt.I.get<AppointmentProvider>();
  List<AppointmentResponse> lichHenList = [];
  List<String> lichhen = ['dsadsadsa'];
  DoctorSignUpProvider doctorSignUpProvider =
      GetIt.I.get<DoctorSignUpProvider>();
  DoctorResponse doctorResponse = DoctorResponse();
  String userId = '';

  @override
  void onInit() {
    super.onInit();
    getUerId();
  }

  void getUerId() {
    sl.get<SharedPreferenceHelper>().userId.then((value) {
      userId = value!;
      getDoctor(userId);
    });
  }

  // void getDoctor() async {
  //   doctorSignUpProvider.getDoctorById(
  //       id: userId,
  //       onSuccess: (onSuccess) {
  //         doctorResponse = onSuccess;
  //         update();
  //       },
  //       onError: (err) {
  //         print(err);
  //       });
  // }
  void getDoctor(String id) {
    doctorSignUpProvider.getDoctorById(
        id: id,
        onSuccess: (data) {
          doctorResponse = data;
          getLichHen();
          update();
        },
        onError: (err) {});
  }

  void getLichHen() async {
    appointmentProvider.getAppointmentByDoctorId(
        id: doctorResponse.id.toString(),
        onSuccess: (onSuccess) {
          lichHenList = onSuccess;
          print(lichHenList[0].toJson());
          update();
          isLoading = false;
        },
        onError: (err) {
          print(err);
        });
  }
}

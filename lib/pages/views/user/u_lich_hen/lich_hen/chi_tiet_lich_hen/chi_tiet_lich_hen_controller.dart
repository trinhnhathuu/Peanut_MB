import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/di_container.dart';
import 'package:peanut_app/models/request/appointment_resquest.dart';

import '../../../../../../models/response/appointment_response.dart';
import '../../../../../../providers/appointment_provider.dart';
import '../../../../../../sharedpref/shared_preference_helper.dart';

class ChiTietLichHenController extends GetxController {
  bool isLoading = true;
  AppointmentResponse? appointment;
  AppointmentRequest appointmentRequest = AppointmentRequest();
  AppointmentProvider appointmentProvider = GetIt.I.get<AppointmentProvider>();
  String userRole = '';
  @override
  void onInit() {
    getRole();
  }

  void getRole() {
    sl.get<SharedPreferenceHelper>().typeAccount.then((value) {
      userRole = value ?? '';
      print(userRole);
      getArgument();
      update();
    });
  }

  void xacNhanLichHen() {
    appointmentRequest.status = '2';
    appointmentRequest.id = appointment!.id.toString();
    appointmentProvider.update(
        id: appointment!.id.toString(),
        data: appointmentRequest,
        onSuccess: (onSuccess) {
          print(onSuccess.toJson());
          Get.back();
        },
        onError: (err) {});
  }

  void getArgument() {
    appointment = Get.arguments as AppointmentResponse;
    isLoading = false;
  }
}

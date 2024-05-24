import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/di_container.dart';
import 'package:peanut_app/models/response/appointment_response.dart';
import 'package:peanut_app/providers/appointment_provider.dart';

import '../../../../../sharedpref/shared_preference_helper.dart';

class DanhSachLichHenController extends GetxController {
  bool isLoading = false;
  AppointmentResponse appointmentResponse = AppointmentResponse();
  AppointmentProvider appointmentProvider = GetIt.I.get<AppointmentProvider>();
  List<AppointmentResponse> lichHenList = [];
  List<String> lichhen = ['dsadsadsa'];
  String userId = '';

  @override
  void onInit() {
    super.onInit();
    getUerId();
  }

  void getUerId() {
    sl.get<SharedPreferenceHelper>().userId.then((value) {
      userId = value!;
      getLichHen();
    });
  }

  void getLichHen() async {
    appointmentProvider.paginate(
        userId: '$userId',
        page: 1,
        limit: 10,
        onSuccess: (onSuccess) {
          lichHenList = onSuccess;
          update();
        },
        onError: (err) {
          print(err);
        });
  }
}

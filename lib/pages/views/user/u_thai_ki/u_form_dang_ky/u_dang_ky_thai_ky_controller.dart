import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:peanut_app/models/request/pregnancy_request.dart';
import 'package:peanut_app/models/response/pregnancy_response.dart';
import 'package:peanut_app/providers/pregnancy_provider.dart';
import 'package:peanut_app/routes/app_routes.dart';

import '../../../../../di_container.dart';
import '../../../../../sharedpref/shared_preference_helper.dart';

class DangKyThaiKyFormController extends GetxController {
  PregnancyProvider pregnancyProvider = GetIt.I.get<PregnancyProvider>();
  PregnancyResponse pregnancyResponse = PregnancyResponse();
  PregnancyRequest pregnancyRequest = PregnancyRequest();
  Rx userId = ''.obs;
  TextEditingController ngay_du_sinh = TextEditingController();
  TextEditingController tuan_thai = TextEditingController();
  List test = ['1', '2', '3'];

  @override
  void onInit() {
    super.onInit();
     sl.get<SharedPreferenceHelper>().userId.then((value) => {
         userId.value = value!,
         update()
      });
  }

  
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
        pregnancyRequest.dueDate = value.toString();
        print(pregnancyRequest.dueDate);
        controller.text = formattedDate;
      }
    });
  }

  void submitForm() {
    pregnancyRequest.userId = userId.value;
    pregnancyRequest.week = int.parse(tuan_thai.text);
    print(pregnancyRequest.toJson());
    pregnancyProvider.create(
        data: pregnancyRequest,
        onSuccess: (data) {
          print(data.toJson());
          Get.offAndToNamed(AppRoutes.U_THAI_KY, arguments: data);
        },
        onError: (err) {
          print(err);
        });
  }
}

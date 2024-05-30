import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/response/pregnancy_guide_response.dart';
import 'package:peanut_app/network/repository/pregnancy_guide_repository.dart';
import 'package:peanut_app/providers/pregnancy_guide_provider.dart';
import 'package:peanut_app/providers/pregnancy_provider.dart';

import '../../../../di_container.dart';
import '../../../../models/response/pregnancy_response.dart';
import '../../../../sharedpref/shared_preference_helper.dart';

class ThaiKyController extends GetxController {
  bool isLoading = true;
  PregnancyGuideProvider pregnancyGuideProvider =
      GetIt.I.get<PregnancyGuideProvider>();
  PregnancyGuideResponse pregnancyGuideResponse = PregnancyGuideResponse();
  PregnancyProvider pregnancyProvider = GetIt.I.get<PregnancyProvider>();
  PregnancyResponse pregnancyResponse = PregnancyResponse();
  List<Tab> tabs = [
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 3'),
  ];
  String userId = '';

  @override
  void onInit() {
    super.onInit();
    sl.get<SharedPreferenceHelper>().userId.then((value) =>
        {userId = value!, getPregnancy(userId), getGuild(userId), update()});
  }

  void getPregnancy(String userId) {
    pregnancyProvider.getPregnancyByUserId(
        userId: userId,
        onSuccess: (data) {
          pregnancyResponse = data;
          print(data.toJson());
          update();
        },
        onError: (err) {
          print(err);
        });
  }

  void getGuild(String userId) {
    pregnancyGuideProvider.getPregnancyGuideByWeekUser(
        userId: userId,
        onSuccess: (data) {
          pregnancyGuideResponse = data;
          print('alooo');
          print(data.toJson());
          isLoading = false;
          update();
        },
        onError: (err) {
          print(err);
        });
  }
}

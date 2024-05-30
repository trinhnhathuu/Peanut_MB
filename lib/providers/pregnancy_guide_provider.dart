import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/pregnancy_guide_response.dart';
import 'package:peanut_app/network/repository/pregnancy_guide_repository.dart';

class PregnancyGuideProvider {
  PregnancyGuideRepository pregnancyGuideRespository =
      PregnancyGuideRepository();
  PregnancyGuideProvider();

  Future<void> getPregnancyGuideByWeekUser({
    required String userId,
    required Function(PregnancyGuideResponse pregnancy) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse =
        await pregnancyGuideRespository.getPregnancyGuideByWeekUser(userId);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      final result = apiResponse.response.data as  dynamic;
      print(result);
      onSuccess(PregnancyGuideResponse.fromJson(result));
    } else {
      print(apiResponse.error);
      onError(apiResponse.error);
    }
  }
}

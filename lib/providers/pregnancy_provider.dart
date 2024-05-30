import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/pregnancy_request.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/pregnancy_response.dart';
import 'package:peanut_app/network/repository/pregnancy_respository.dart';

class PregnancyProvider {
  PregnancyRespository pregnancyRespository =
      GetIt.I.get<PregnancyRespository>();
  PregnancyProvider();

  Future<void> create({
    required PregnancyRequest data,
    required Function(PregnancyRequest pregnancy) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await pregnancyRespository.create(data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(PregnancyRequest.fromJson(results as Map<String, dynamic>));
    } else {
      print(apiResponse.error);
      onError(apiResponse.error);
    }
  }

  Future<void> getPregnancyByUserId({
    required String userId,
    required Function(PregnancyResponse pregnancy) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse =
        await pregnancyRespository.getPregnancyByUserId(userId);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      final result = apiResponse.response.data as Map<String, dynamic>;
      onSuccess(PregnancyResponse.fromJson(result));
    } else {
      onError(apiResponse.error);
    }
  }
}

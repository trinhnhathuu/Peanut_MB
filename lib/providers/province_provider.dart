import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/provinces_response.dart';
import 'package:peanut_app/network/repository/provinces_repository.dart';

class ProvinceProvider {
  ProvincesRepository provincesRepository = ProvincesRepository();
  ProvinceProvider();

  Future<void> getProvinces({
    required Function(List<ProvinceResponse> provinces) onSuccess,
    required Function(dynamic error) onError,
  }
  ) async {
   final ApiResponse apiResponse = await provincesRepository.getProvinces();
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results.map((e) => ProvinceResponse.fromJson(e as Map<String, dynamic>)).toList());
        } else {
          onError(apiResponse.error);
        }
  }

  Future<void> getProvinceByCode({
    required String code,
    required Function(ProvinceResponse province) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await provincesRepository.getProvinceByCode(code);
    if (apiResponse.response.statusCode! >= 200 && apiResponse.response.statusCode! <= 300) {
      final result =  apiResponse.response.data as Map<String, dynamic>;
      onSuccess(ProvinceResponse.fromJson(result));
    } else{
      onError(apiResponse.error);
    }
  }
}

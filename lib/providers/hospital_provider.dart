import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/hospitals_response.dart';
import 'package:peanut_app/network/repository/hospital_repository.dart';

class HospitalProvider{
  HospitalRepository hospitalRepository = HospitalRepository();

  Future<void> getHospitals({
    required Function(List<HospitalResponse> hospitals) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await hospitalRepository.getHospitals();
    if (apiResponse.response.statusCode! >= 200 && apiResponse.response.statusCode! <= 300) {
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results.map((e) => HospitalResponse.fromJson(e as Map<String, dynamic>)).toList());
    } else{
      onError(apiResponse.error);
    }
  }

  Future<void> getHospitalsByProvinceCode({
    required String code,
    required Function(List<HospitalResponse> hospitals) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await hospitalRepository.getHospitalByProvinceCode(code);
    if (apiResponse.response.statusCode! >= 200 && apiResponse.response.statusCode! <= 300) {
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results.map((e) => HospitalResponse.fromJson(e as Map<String, dynamic>)).toList());

    } else{
      onError(apiResponse.error);
    }
  }
}
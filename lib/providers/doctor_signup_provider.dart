import 'package:peanut_app/models/request/doctor_signup_request.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/doctor_resopnse.dart';
import 'package:peanut_app/network/repository/doctor_signup_repository.dart';

class DoctorSignUpProvider{
  DoctorSignUpRepository doctorSignUpRepository = DoctorSignUpRepository();
  DoctorSignUpProvider();

  Future<void> create(
    { required DoctorSignUpRequest doctorSignUpRequest,
    required Function(DoctorSignUpRequest doctorSignUpRequest) onSuccess,
    required Function(dynamic error) onError
    }) async {
      final ApiResponse apiResponse = await doctorSignUpRepository.create(doctorSignUpRequest);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(DoctorSignUpRequest.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }
// tìm kiếm bác sĩ by idHospital
  Future<void> getDoctorByHospital(
    { required String idHospital,
    required Function(List<DoctorResponse> doctors) onSuccess,
    required Function(dynamic error) onError
    }) async {
      final ApiResponse apiResponse = await doctorSignUpRepository.searchDoctorByHospitalId(idHospital);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      final List<DoctorResponse> doctors = results.map((e) => DoctorResponse.fromJson(e as Map<String, dynamic>)).toList();
      onSuccess(doctors);
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> getDoctorById(
    { required String id,
    required Function(DoctorResponse doctorResponse) onSuccess,
    required Function(dynamic error) onError
    }) async {
      final ApiResponse apiResponse = await doctorSignUpRepository.findById(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(DoctorResponse.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }
}
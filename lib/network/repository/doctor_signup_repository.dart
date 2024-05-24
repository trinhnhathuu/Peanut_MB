import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/doctor_signup_request.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

import '../../models/response/ApiResponse.dart';

class DoctorSignUpRepository {
  DoctorSignUpRepository();
  DioClient? dioClient = GetIt.I.get<DioClient>();
  // đăng ký
  Future<ApiResponse> create(DoctorSignUpRequest doctorSignUpRequest) async {
    try {
      final response =
          await dioClient!.post('/doctor', data: doctorSignUpRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  // tìm kiếm bác sĩ idHospital

  Future<ApiResponse> searchDoctorByHospitalId(String idHospital) async {
    try {
      final response = await dioClient!.get('/doctor/hospital/$idHospital');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> findById(String id) async {
    try {
      final response = await dioClient!.get('/doctor/user/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}

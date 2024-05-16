import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

class HospitalRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  HospitalRepository();

  Future<ApiResponse> getHospitals() async {
     try {
      final response = await dioClient!.get('/hospitals');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
   Future<ApiResponse> getHospitalByProvinceCode(
      String code
   ) async {
    try {
      final response = await dioClient!.get('/hospitals/province/$code');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}

import 'package:get_it/get_it.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

import '../../models/response/ApiResponse.dart';

class ProvincesRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();

  ProvincesRepository();
  // get all

  Future<ApiResponse> getProvinces() async {
    try {
      final response = await dioClient!.get('/provinces');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
   Future<ApiResponse> getProvinceByCode(
      String code
   ) async {
    try {
      final response = await dioClient!.get('/provinces/$code');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

}

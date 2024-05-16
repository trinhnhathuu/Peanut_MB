import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/tai_khoan_request.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';

import '../dio/dio_cleint.dart';

class TaiKhoanRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();

  TaiKhoanRepository();

  // đăng ký
  Future<ApiResponse> create(TaiKhoanRequest taiKhoanRequest) async {
    try {
      final response =  await dioClient!.post('/user/signup', data: taiKhoanRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
      }
  }
   Future<ApiResponse> findByEmail(TaiKhoanRequest taiKhoanRequest) async {
    try {
      final response =  await dioClient!.post('/user/login', data: taiKhoanRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
      }
  }

   Future<ApiResponse> findById(String id) async {
    try {
      final response =  await dioClient!.get('/user/?userId=${id}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
      }
  }

   Future<ApiResponse> updateUsers(TaiKhoanRequest taiKhoanRequest) async {
    try {
      final response =  await dioClient!.put('/user',data: taiKhoanRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
      }
  }
}



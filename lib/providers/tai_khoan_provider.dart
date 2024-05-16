import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';
import 'package:peanut_app/models/response/token_key_response.dart';
import 'package:peanut_app/network/repository/tai_khoan_repository.dart';
import 'package:peanut_app/sharedpref/shared_preference_helper.dart';

import '../models/request/tai_khoan_request.dart';

class TaiKhoanProvider {
  TaiKhoanRepository taiKhoanRepository = GetIt.I.get<TaiKhoanRepository>();
  TaiKhoanProvider();

  Future<void> create({
    required TaiKhoanRequest data,
    required Function(TaiKhoanRequest taiKhoan) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await taiKhoanRepository.create(data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(TaiKhoanRequest.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
    
  }
   Future<void> findByEmail({
    required TaiKhoanRequest data,
    required Function(TaiKhoanRequest taiKhoan, TokenKeyResponse token) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await taiKhoanRepository.findByEmail(data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data['message'];
      final Map<String, dynamic> user = results['metadata']['user'];
      final Map<String, dynamic> tokens = results['metadata']['tokens'];
      TaiKhoanRequest taiKhoanRequest = TaiKhoanRequest.fromJson(user);
      TokenKeyResponse tokenModel = TokenKeyResponse.fromJson(tokens);
      onSuccess(taiKhoanRequest, tokenModel);
    } else {
      onError(apiResponse.error);
    }
    
  }

  Future<void> findById ({
    required String id,
    required Function(TaiKhoanResponse taiKhoan) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await taiKhoanRepository.findById(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(TaiKhoanResponse.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }
  Future<void> updateUsers ({
    required TaiKhoanRequest data,
    required Function(TaiKhoanRequest taiKhoan) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await taiKhoanRepository.updateUsers(data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(TaiKhoanRequest.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }
 }

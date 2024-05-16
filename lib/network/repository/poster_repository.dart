import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/poster_request.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

class PosterRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  PosterRepository();

  Future<ApiResponse> create(PosterRequest posterRequest) async {
    try {
      final response =
          await dioClient!.post('/poster', data: posterRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
    Future<ApiResponse> get() async {
    try {
      final response =
          await dioClient!.get('/poster');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}

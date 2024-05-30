import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

class PregnancyGuideRepository {
  final DioClient? dioClient = GetIt.I<DioClient>();

  Future<ApiResponse> getPregnancyGuideByWeekUser(String userId) async {
    try {
      final response = await dioClient!.get('/pregnancy-guide/user/$userId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}

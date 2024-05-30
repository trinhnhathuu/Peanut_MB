
// router.post('/pregnancy', asyncHandler(PregnancyController.create))
// router.get('/pregnancy/:userId', asyncHandler(PregnancyController.getPregnancyByUserId))
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/pregnancy_request.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

class PregnancyRespository {
  PregnancyRespository();

  final DioClient? dioClient = GetIt.I<DioClient>();

  Future<ApiResponse> create(PregnancyRequest pregnancyRequest) async {
    try {
      final response =
          await dioClient!.post('/pregnancy', data: pregnancyRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> getPregnancyByUserId(String userId) async {
    try {
      final response =
          await dioClient!.get('/pregnancy/user/$userId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

}

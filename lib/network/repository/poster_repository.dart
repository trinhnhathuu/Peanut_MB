import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/poster_request.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';
// router.post('/poster', asyncHandler(posterController.create))
// router.get('/poster', asyncHandler(posterController.getPosters))
// router.get('/poster/user/:userId/posts/', asyncHandler(posterController.getPostersByUserIdWithPage))
// router.delete('/poster/:id', asyncHandler(posterController.deletePoster))
// router.put('/poster/:id', asyncHandler(posterController.updatePoster))
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

  Future<ApiResponse> getByUserId({
 required String userId,
    required int page,required int limit
  }
   
    ) async {
    try {
      final response =
          await dioClient!.get('/poster/user/$userId/posts/?page=$page&limit=$limit');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> delete(String id) async {
    try {
      final response =
          await dioClient!.delete('/poster/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> update(String id, PosterRequest posterRequest) async {
    try {
      final response =
          await dioClient!.put('/poster/$id', data: posterRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

   Future<ApiResponse> getPosterByBYT() async {
   try {
      final response =
          await dioClient!.get('/poster/byt');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
  
}

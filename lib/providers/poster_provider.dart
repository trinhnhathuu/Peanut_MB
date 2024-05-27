import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/poster_request.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/poster_response.dart';
import 'package:peanut_app/network/repository/poster_repository.dart';

class PosterProvider {
  PosterRepository posterRepository = GetIt.I.get<PosterRepository>();
  PosterProvider();

  Future<void> create({
    required PosterRequest data,
    required Function(PosterRequest poster) onSuccess,
    required Function(dynamic error) onError,
  })  async{
    final ApiResponse apiResponse = await posterRepository.create(data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(PosterRequest.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> getALLPoster({
    required Function(List<PosterResponse> posters) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await posterRepository.get();
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results.map((e) => PosterResponse.fromJson(e as Map<String, dynamic>)).toList());
        } else {
          onError(apiResponse.error);
        }
  }

  Future<void> getPosterByUserId({
    required String userId,
    required int page,
    required int limit,
    required Function(List<PosterResponse> posters) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await posterRepository.getByUserId(userId:userId,page: page, limit:limit);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results.map((e) => PosterResponse.fromJson(e as Map<String, dynamic>)).toList());
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> delete({
    required String id,
    required Function(PosterResponse poster) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await posterRepository.delete(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(PosterResponse.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> update({
    required String id,
    required PosterRequest data,
    required Function(PosterRequest poster) onSuccess,
    required Function(dynamic error) onError,
  }) async{
    final ApiResponse apiResponse = await posterRepository.update(id, data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(PosterRequest.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }
}

import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/comment_response.dart';
import 'package:peanut_app/network/repository/comment_repository.dart';

import '../models/request/comment_request.dart';

class CommentProvider {
  final CommentRepository _commentRepository = CommentRepository();

  Future<void> create({
    required CommentRequest data,
    required Function(CommentRequest comment) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await _commentRepository.create(data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(CommentRequest.fromJson(results as Map<String, dynamic>));
    } else {
      print(apiResponse.error);
      onError(apiResponse.error);
    }
  }

  Future<void> getCommentByPostId({
    required String id,
    required Function(List<CommentResponse> comments) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse =
        await _commentRepository.getCommentByPostId(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results
          .map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
          .toList());
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> getCommentByUserId({
    required String id,
    required Function(List<CommentResponse> comments) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse =
        await _commentRepository.getCommentByUserId(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      final List<CommentResponse> comments = results
          .map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      onSuccess(comments);
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> update({
    required String id,
    required CommentRequest data,
    required Function(CommentRequest comment) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await _commentRepository.update(id, data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(CommentRequest.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> delete({
    required String id,
    required Function(CommentRequest comment) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await _commentRepository.delete(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(CommentRequest.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }
}

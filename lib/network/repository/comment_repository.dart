import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/comment_request.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

import '../../models/response/ApiResponse.dart';

// backend
//router.post('/comments', asyncHandler(commentController.create))
// router.get('/comments/:id', asyncHandler(commentController.getCommentById))
// router.get('/comments/post/:postId', asyncHandler(commentController.getCommentByPostId))
// router.get('/comments/user/:userId', asyncHandler(commentController.getCommentByUserId))
// router.put('/comments/:id', asyncHandler(commentController.updateComment))
class CommentRepository {
  CommentRepository();
  DioClient? dioClient = GetIt.I.get<DioClient>();
  Future<ApiResponse> create(CommentRequest commentRequest) async {
    try {
      final response =
          await dioClient!.post('/comments', data: commentRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> getCommentById(String id) async {
    try {
      final response = await dioClient!.get('/comments/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> getCommentByPostId(String id) async {
    try{
      final response = await dioClient!.get('/comments/post/$id');
      return ApiResponse.withSuccess(response);
    } catch(e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> getCommentByUserId(String id) async {
    try{
      final response = await dioClient!.get('/comments/user/$id');
      return ApiResponse.withSuccess(response);
    } catch(e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> update(String id, CommentRequest commentRequest) async {
    try {
      final response =
          await dioClient!.put('/comments/$id', data: commentRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> delete(String id) async {
    try {
      final response = await dioClient!.delete('/comments/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}

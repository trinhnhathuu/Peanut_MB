import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/comment_request.dart';
import 'package:peanut_app/models/response/comment_response.dart';
import 'package:peanut_app/models/response/poster_response.dart';
import 'package:peanut_app/providers/comment_provider.dart';

import '../../../../../di_container.dart';
import '../../../../../sharedpref/shared_preference_helper.dart';

class ChiTietBaiVietController extends GetxController {
  bool isLoading = true;
  String title = '';
  PosterResponse posterResponse = PosterResponse();
  TextEditingController contentController = TextEditingController();
  CommentProvider commentProvider = GetIt.I.get<CommentProvider>();
  CommentRequest commentRequest = CommentRequest();
  CommentResponse commentResponse = CommentResponse();
  RxList<CommentResponse> listComment = <CommentResponse>[].obs;
  String userId = '';

  @override
  void onInit() {
    posterResponse = Get.arguments as PosterResponse;
    title = posterResponse.title!;
    sl.get<SharedPreferenceHelper>().userId.then((value) {
      userId = value!;
      update();
    });
    getComment();
    isLoading = false;
    update();
  }

  void addComment() async {
    commentRequest.content = contentController.text;
    commentRequest.postId = posterResponse.id.toString();
    commentRequest.userId = userId;
    commentProvider.create(
        data: commentRequest,
        onSuccess: (data) {
          contentController.clear();
          print('success');
          getComment();
        },
        onError: (err) {
          print(err);
        });
  }

  void getComment() async {
    commentProvider.getCommentByPostId(
        id: posterResponse.id.toString(),
        onSuccess: (data) {
          listComment.value = data;
          print(data[0].toJson());
          update();
        },
        onError: (err) {
          print(err);
        });
  }
}

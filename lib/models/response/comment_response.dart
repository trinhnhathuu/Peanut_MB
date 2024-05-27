import 'package:peanut_app/models/response/poster_response.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';

class CommentResponse {
  String? id;
  TaiKhoanResponse? userId;
  PosterResponse? postId;
  String? content;
  String? createdAt;
  String? updatedAt;

  CommentResponse({this.id, this.userId, this.postId, this.content});

  CommentResponse.fromJson(Map<String, dynamic> json) {
    if(id != null) id = json['id'].toString();
    userId = json['userId'] != null
        ? TaiKhoanResponse.fromJson(json['userId'])
        : null;
    postId = json['postId'] != null
        ?  PosterResponse.fromJson(json['postId'])
        : null;
    content = (json['content'] == null) ? null : json['content'].toString();
    createdAt = (json['createdAt'] == null) ? null : json['createdAt'].toString();
    updatedAt = (json['updatedAt'] == null) ? null : json['updatedAt'].toString();

    

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if(id != null) data['id'] = id;
    if(userId != null) data['userId'] = userId!.toJson();
    if(postId != null) data['postId'] = postId!.toJson();
    if(content != null) data['content'] = content;
    if(createdAt != null) data['createdAt'] = createdAt;
    if(updatedAt != null) data['updatedAt'] = updatedAt;
    return data;
  }
  @override
  String toString() {
    return 'CommentResponse{id: $id, userId: $userId, content: $content}';
  }
  
}

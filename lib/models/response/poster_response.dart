import 'package:peanut_app/models/response/tai_khoan_response.dart';

class PosterResponse {
  String? id;
  TaiKhoanResponse? userId;
  String? title;
  String? content;
  String? image;
  String? type;
  String? createdAt;
  String? updatedAt;

  PosterResponse(
      {this.userId, this.title, this.content, this.image, this.type});

  PosterResponse.fromJson(Map<String, dynamic> json) {
    if(json['_id'] != null) id = json['_id'].toString();
    if (json['userId'] != null && json['userId'].toString().length != 24) {
      userId =  TaiKhoanResponse.fromJson(json['userId'] as Map<String, dynamic>);
    } else {
      userId = null;
    }
    title = json['title'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (userId != null) data['userId'] = userId;
    if (title != null) data['title'] = title;
    if (content != null) data['content'] = content;
    if (image != null) data['image'] = image;
    if (type != null) data['type'] = type;
    if (createdAt != null) data['createdAt'] = createdAt;
    if (updatedAt != null) data['updatedAt'] = updatedAt;
    return data;
  }
}

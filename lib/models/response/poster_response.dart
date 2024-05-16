import 'package:peanut_app/models/response/tai_khoan_response.dart';

class PosterResponse {
  TaiKhoanResponse? userId;
  String? title;
  String? content;
  String? image;
  String? type;

  PosterResponse(
      {this.userId, this.title, this.content, this.image, this.type});

  PosterResponse.fromJson(Map<String, dynamic> json) {
    if (json['userId'] != null) {
      userId = new TaiKhoanResponse.fromJson(json['userId'] as Map<String, dynamic>);
    } else {
      userId = null;
    }
    title = json['title'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (userId != null) data['userId'] = userId;
    if (title != null) data['title'] = title;
    if (content != null) data['content'] = content;
    if (image != null) data['image'] = image;
    if (type != null) data['type'] = type;
    return data;
  }
}

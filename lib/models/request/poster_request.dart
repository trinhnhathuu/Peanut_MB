class PosterRequest {
  String? id;
  String? userId;
  String? title;
  String? content;
  String? image;
  String? type;

  PosterRequest({ this.id,this.userId, this.title, this.content, this.image, this.type});

  PosterRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (userId != null) data['userId'] = userId;
    if (title != null) data['title'] = title;
    if (content != null) data['content'] = content;
    if (image != null) data['image'] = image;
    if (type != null) data['type'] = type;
    return data;
  }
}

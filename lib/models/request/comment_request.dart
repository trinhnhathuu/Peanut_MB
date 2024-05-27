class CommentRequest {
  String? id;
  String? userId;
  String? postId;
  String? content;

  CommentRequest({this.id, this.userId, this.content, this.postId});


  CommentRequest.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? null : json['id'].toString();
    userId = (json['userId'] == null) ? null : json['userId'].toString();
    postId = (json['postId'] == null) ? null : json['postId'].toString();
    content = (json['content'] == null) ? null : json['content'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if(id != null) data['id'] = id;
    if(userId != null) data['userId'] = userId;
    if(postId != null) data['postId'] = postId;
    if(content != null) data['content'] = content;
    return data;
  }
  
}

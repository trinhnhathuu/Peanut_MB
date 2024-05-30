class PregnancyRequest {
  String? id;
  String? userId;
  int? week;
  String? dueDate;

  PregnancyRequest({this.id, this.userId, this.week, this.dueDate});

  PregnancyRequest.fromJson(Map<String, dynamic> json) {
    if (id != null) id = json['id'].toString();
    userId = (json['userId'] == null) ? null : json['userId'].toString();
    week = int.tryParse(json['week'].toString());
    dueDate = json['dueDate'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (userId != null) data['userId'] = userId;
    if (week != null) data['week'] = week;
    if (dueDate != null) data['dueDate'] = dueDate;
    return data;
  }
}

import 'package:peanut_app/models/response/tai_khoan_response.dart';

class PregnancyResponse {
  String? id;
  TaiKhoanResponse? userId;
  int? week;
  DateTime? dueDate;

  PregnancyResponse({this.id, this.userId, this.week, this.dueDate});

  PregnancyResponse.fromJson(Map<String, dynamic> json) {
    
    if(json['_id'] != null) id = json['_id'].toString();
    userId = (json['userId'] == null) ? null : TaiKhoanResponse.fromJson(json['userId']);
    week = json['week'];
    dueDate = json['dueDate'] == null ? null : DateTime.parse(json['dueDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (id != null) data['_id'] = id;
    if (userId != null) data['userId'] = userId!.toJson();
    if (week != null) data['week'] = week;
    if(dueDate != null) data['dueDate'] = dueDate!.toIso8601String();
    return data;

}
}
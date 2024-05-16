import 'package:peanut_app/models/response/tai_khoan_response.dart';

class AppointmentResponse {
  String? id;
  TaiKhoanResponse? userId;
  TaiKhoanResponse? doctorId;
  String? date;
  String? time;
  String? status;
  String? gender;
  String? provinceCode;
  String? hospitalCode;
  String? name;
  String? birthday;
  String? phone;
  String? description;

  AppointmentResponse({
    this.id,
    this.userId,
    this.doctorId,
    this.date,
    this.time,
    this.status,
    this.gender,
    this.provinceCode,
    this.hospitalCode,
    this.name,
    this.birthday,
    this.phone,
    this.description,
  });

  AppointmentResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    userId = json['user_id'] != null ? TaiKhoanResponse.fromJson(json['user_id'] as Map<String, dynamic>) : null;
    doctorId = json['doctor_id'] != null ? TaiKhoanResponse.fromJson(json['doctor_id'] as Map<String, dynamic>) : null;
    date = json['date']?.toString();
    time = json['time']?.toString();
    status = json['status']?.toString();
    gender = json['gender']?.toString();
    provinceCode = json['provinceCode']?.toString();
    hospitalCode = json['hospitalCode']?.toString();
    name = json['name']?.toString();
    birthday = json['birthday']?.toString();
    phone = json['phone']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['_id'] = id;
    if (userId != null) data['user_id'] = userId!.toJson();
    if (doctorId != null) data['doctor_id'] = doctorId!.toJson();
    if (date != null) data['date'] = date;
    if (time != null) data['time'] = time;
    if (status != null) data['status'] = status;
    if (gender != null) data['gender'] = gender;
    if (provinceCode != null) data['provinceCode'] = provinceCode;
    if (hospitalCode != null) data['hospitalCode'] = hospitalCode;
    if (name != null) data['name'] = name;
    if (birthday != null) data['birthday'] = birthday;
    if (phone != null) data['phone'] = phone;
    if (description != null) data['description'] = description;
    return data;
  }
}

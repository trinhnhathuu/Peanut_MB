import 'package:peanut_app/models/response/doctor_resopnse.dart';
import 'package:peanut_app/models/response/hospitals_response.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';

import 'provinces_response.dart';

class AppointmentResponse {
  String? id;
  TaiKhoanResponse? userId;
  DoctorResponse? doctorId;
  String? date;
  String? time;
  String? status;
  String? gender;
  ProvinceResponse? idProvince;
  HospitalResponse?idHospital;
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
    this.idHospital ,
    this.idProvince,
    this.name,
    this.birthday,
    this.phone,
    this.description,
  });

  AppointmentResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    userId = json['userId'] != null ? TaiKhoanResponse.fromJson(json['userId'] as Map<String, dynamic>) : null;
    doctorId = json['doctorId'] != null ? DoctorResponse.fromJson(json['doctorId'] as Map<String, dynamic>) : null;
    date = json['date']?.toString();
    time = json['time']?.toString();
    status = json['status']?.toString();
    gender = json['gender']?.toString();
     if (json['idHospital'] != null &&
        json['idHospital'].toString().length != 24) {
      idHospital = HospitalResponse.fromJson(
          json['idHospital'] as Map<String, dynamic>);
    } else {
      idHospital =  null;
    }
     if (json['idProvince'] != null &&
        json['idProvince'].toString().length != 24) {
      idProvince = ProvinceResponse.fromJson(
          json['idProvince'] as Map<String, dynamic>);
    } else {
      idProvince = null;
    }
    name = json['name']?.toString();
    birthday = json['birthday']?.toString();
    phone = json['phone']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (userId != null) data['userId'] = userId!.toJson();
    if (doctorId != null) data['doctorId'] = doctorId!.toJson();
    if (date != null) data['date'] = date;
    if (time != null) data['time'] = time;
    if (status != null) data['status'] = status;
    if (gender != null) data['gender'] = gender;
    if (idProvince != null) data['idProvince'] = idProvince!.toJson();
    if (idHospital != null) data['idHospital'] = idHospital!.toJson();
    if (name != null) data['name'] = name;
    if (birthday != null) data['birthday'] = birthday;
    if (phone != null) data['phone'] = phone;
    if (description != null) data['description'] = description;
    return data;
  }
}

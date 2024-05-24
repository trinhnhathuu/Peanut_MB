import 'package:peanut_app/models/response/hospitals_response.dart';
import 'package:peanut_app/models/response/tai_khoan_response.dart';

class DoctorResponse {
  String? id;
  TaiKhoanResponse? userId;
  String? fullName;
  String? phoneWork;
  String? emailWork;
  String? hospitalAddress;
  HospitalResponse? idHospital;
  String? department;
  double? lng;
  double? lat;
  List? imageCard;

  DoctorResponse(
      {this.id,
      this.userId,
      this.fullName,
      this.phoneWork,
      this.emailWork,
      this.hospitalAddress,
      this.idHospital,
      this.department,
      this.lng,
      this.lat,
      this.imageCard});

  DoctorResponse.fromJson(Map<String, dynamic> json) {
    id = (json['_id'] == null) ? null : json['_id'];

    if (json['userId'] != null && json['userId'].toString().length != 24) {
      userId =
          TaiKhoanResponse.fromJson(json['userId'] as Map<String, dynamic>);
    } else {
      userId = null;
    }

    fullName = (json['fullName'] == null) ? null : json['fullName'].toString();
    phoneWork =
        (json['phoneWork'] == null) ? null : json['phoneWork'].toString();
    emailWork =
        (json['emailWork'] == null) ? null : json['emailWork'].toString();
    hospitalAddress = (json['hospitalAddress'] == null)
        ? null
        : json['hospitalAddress'].toString();
    if (json['idHospital'] != null &&
        json['idHospital'].toString().length != 24) {
      idHospital =
          HospitalResponse.fromJson(json['idHospital'] as Map<String, dynamic>);
    } else {
      idHospital = null;
    }
    department =
        (json['department'] == null) ? null : json['department'].toString();
    lat = double.tryParse(json['lat'].toString());
    lng = double.tryParse(json['lng'].toString());
    if (json['imageCard'] != null) {
      imageCard = [];
      json['imageCard'].forEach((v) {
        imageCard!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (userId != null) data['userId'] = userId;
    if (fullName != null) data['fullName'] = fullName;
    if (phoneWork != null) data['phoneWork'] = phoneWork;
    if (emailWork != null) data['emailWork'] = emailWork;
    if (hospitalAddress != null) data['hospitalAddress'] = hospitalAddress;
    if (idHospital != null) data['idHospital'] = idHospital;
    if (department != null) data['department'] = department;
    if (lng != null) data['lng'] = lng;
    if (lat != null) data['lat'] = lat;
    if (imageCard != null) data['imageCard'] = imageCard;
    return data;
  }
}

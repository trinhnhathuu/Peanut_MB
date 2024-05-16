class DoctorSignUpRequest {
  String? id;
  String? userId;
  String? fullName;
  String? phoneWork;
  String? emailWork;
  String? hospitalAddress;
  String? hospitalName;
  String? appointment;
  double? lng;
  double? lat;
  List? imageCard;

  DoctorSignUpRequest(
      {this.id,
      this.userId,
      this.fullName,
      this.phoneWork,
      this.emailWork,
      this.hospitalAddress,
      this.hospitalName,
      this.appointment,
      this.lng,
      this.lat,
      this.imageCard});

  DoctorSignUpRequest.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? null : json['id'].toString();
    userId = (json['userId'] == null) ? null : json['userId'].toString();
    fullName = (json['fullName'] == null) ? null : json['fullName'].toString();
    phoneWork =
        (json['phoneWork'] == null) ? null : json['phoneWork'].toString();
    emailWork =
        (json['emailWork'] == null) ? null : json['emailWork'].toString();
    hospitalAddress = (json['hospitalAddress'] == null)
        ? null
        : json['hospitalAddress'].toString();
    hospitalName =
        (json['hospitalName'] == null) ? null : json['hospitalName'].toString();
    appointment =
        (json['appointment'] == null) ? null : json['appointment'].toString();
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
    if(id != null) data['id'] = id;
    if(userId != null) data['userId'] = userId;
    if(fullName != null) data['fullName'] = fullName;
    if(phoneWork != null) data['phoneWork'] = phoneWork;
    if(emailWork != null) data['emailWork'] = emailWork;
    if(hospitalAddress != null) data['hospitalAddress'] = hospitalAddress;
    if(hospitalName != null) data['hospitalName'] = hospitalName;
    if(appointment != null) data['appointment'] = appointment;
    if(lng != null) data['lng'] = lng;
    if(lat != null) data['lat'] = lat;
    if(imageCard != null) data['imageCard'] = imageCard;
    return data;
  }
}

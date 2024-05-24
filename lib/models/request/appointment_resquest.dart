class AppointmentRequest {
  String? id;
  String? userId;
  String? doctorId;
  String? date;
  String? time;
  String? status;
  String? gender;
  String? idProvince;
  String? idHospital;
  String? name;
  String? birthday;
  String? phone;
  String? description;

  AppointmentRequest({
    this.id,
    this.userId,
    this.doctorId,
    this.date,
    this.time,
    this.status,
    this.gender,
    this.idProvince,
    this.idHospital,
    this.name,
    this.birthday,
    this.phone,
    this.description,
  });

  AppointmentRequest.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    userId = json['userId']?.toString();
    doctorId = json['doctorId']?.toString();
    date = json['date']?.toString();
    time = json['time']?.toString();
    status = json['status']?.toString();
    gender = json['gender']?.toString();
    idProvince = json['idProvince']?.toString();
    idHospital = json['idHospital']?.toString();
    name = json['name']?.toString();
    birthday = json['birthday']?.toString();
    phone = json['phone']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['_id'] = id;
    if (userId != null) data['userId'] = userId;
    if (doctorId != null) data['doctorId'] = doctorId;
    if (date != null) data['date'] = date;
    if (time != null) data['time'] = time;
    if (status != null) data['status'] = status;
    if (gender != null) data['gender'] = gender;
    if (idProvince != null) data['idProvince'] = idProvince;
    if (idHospital != null) data['idHospital'] = idHospital;
    if (name != null) data['name'] = name;
    if (birthday != null) data['birthday'] = birthday;
    if (phone != null) data['phone'] = phone;
    if (description != null) data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return 'AppointmentRequest(id: $id, userId: $userId, doctorId: $doctorId, date: $date, time: $time, status: $status, gender: $gender, idProvince: $idProvince, hospitalCode: $idHospital, name: $name, birthday: $birthday, phone: $phone, description: $description)';
  }
}

class AppointmentRequest {
  String? id;
  String? userId;
  String? doctorId;
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

  AppointmentRequest({
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

  AppointmentRequest.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    userId = json['user_id']?.toString();
    doctorId = json['doctor_id']?.toString();
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
    if (userId != null) data['user_id'] = userId;
    if (doctorId != null) data['doctor_id'] = doctorId;
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

  @override
  String toString() {
    return 'AppointmentRequest(id: $id, userId: $userId, doctorId: $doctorId, date: $date, time: $time, status: $status, gender: $gender, provinceCode: $provinceCode, hospitalCode: $hospitalCode, name: $name, birthday: $birthday, phone: $phone, description: $description)';
  }
}

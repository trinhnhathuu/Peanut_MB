class TaiKhoanResponse {
  String? id;
  String? email;
  String? name;
  String? password;
  List? role;
  String? phone;
  String? address;
  String? avatar;
  List? tokenDevice;
  String? status;
  String? verified;
  String? gender;
  String? birthday;

  TaiKhoanResponse(
      {this.id,
      this.email,
      this.name,
      this.password,
      this.role,
      this.tokenDevice,
      this.phone,
      this.address,
      this.avatar,
      this.gender,
      this.birthday,
      this.status = 'ACTIVE',
      this.verified = 'UNVERIFIED'});

  TaiKhoanResponse.fromJson(Map<String, dynamic> json) {
    id = (json['_id'] == null) ? null : json['_id'].toString();
    email = (json['email'] == null) ? null : json['email'].toString();
    name = (json['name'] == null) ? null : json['name'].toString();
    password = (json['password'] == null) ? null : json['password'].toString();
    role = (json['role'] == null) ? null : json['role'];
    phone = (json['phone'] == null) ? null : json['phone'].toString();
    address = (json['address'] == null) ? null : json['address'].toString();
    avatar = (json['avatar'] == null) ? null : json['avatar'].toString();
    if (json['tokenDevice'] != null) {
      tokenDevice = [];
      json['tokenDevice'].forEach((v) {
        tokenDevice!.add(v);
      });
    }
    gender = (json['gender'] == null) ? null : json['gender'].toString();
    birthday = (json['birthday'] == null) ? null : json['birthday'].toString();
    status = ((json['status'] == null) ? null : json['status'].toString());
    verified =
        ((json['verified'] == null) ? null : json['verified'].toString());
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (email != null) data['email'] = email;
    if (name != null) data['name'] = name;
    if (password != null) data['password'] = password;
    if (role != null) data['role'] = role;
    if (tokenDevice != null) data['tokenDevice'] = tokenDevice;
    if (phone != null) data['phone'] = phone;
    if (address != null) data['address'] = address;
    if (avatar != null) data['avatar'] = avatar;
    if (tokenDevice != null)
      data['tokenDevice'] = tokenDevice!.map((v) => v).toList();
    if (status != null) data['status'] = status;
    if (verified != null) data['verified'] = verified;
    if (gender != null) data['gender'] = gender;
    if(birthday != null) data['birthday'] = birthday;
    return data;
  }

  @override
  String toString() {
    return 'TaiKhoanResponse(id: $id, email: $email, userName: $name, password: $password, role: $role, tokenDevice: $tokenDevice, phone: $phone, address: $address, avatar: $avatar, status: $status, verified: $verified, gender: $gender, birthday: $birthday)';
  }
}

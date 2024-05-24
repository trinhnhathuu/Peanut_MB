class HospitalResponse {
  String? id;
  String? name;
  String? provinceCode;
  String? code;

  HospitalResponse({this.id, this.name, this.provinceCode, this.code});

  HospitalResponse.fromJson(Map<String, dynamic> json) {
    id = (json['_id'] == null) ? null : json['_id'].toString();
    name = json['name'];
    provinceCode = json['provinceCode'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (provinceCode != null) data['provinceCode'] = provinceCode;
    if (code != null) data['code'] = code;
    return data;
  }
  @override
  String toString(){
    return name.toString();
  }
}

class DistrictsResponse {
  String? id;
  String? name;
  String? code;
  String? provinceCode;

  DistrictsResponse({this.id, this.name, this.code, this.provinceCode});

  DistrictsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    provinceCode = json['provinceCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
     if (name != null) data['name'] = name;
     if (code != null) data['code'] = code;
     if (provinceCode != null) data['provinceCode'] = provinceCode;
    return data;
  }
}

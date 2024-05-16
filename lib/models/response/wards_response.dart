class WardResponse {
  String? id;
  String? name;
  String? code;
  String? districtCode;

  WardResponse({this.id, this.name, this.code, this.districtCode});

  WardResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    districtCode = json['districtCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (code != null) data['code'] = code;
    if (districtCode != null) data['districtCode'] = districtCode;
    return data;
  }
}

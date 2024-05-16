class ProvinceResponse {
  String? id;
  String? name;
  String? code;

  ProvinceResponse({this.id, this.name, this.code});

  ProvinceResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
     if (id != null) data['id'] = id;
     if (name != null) data['name'] = name;
     if (code != null) data['code'] = code;

    return data;
  }
}

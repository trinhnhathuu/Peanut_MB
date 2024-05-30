//  week: { type: Number, required: true, unique: true },
//     pregnancy_info: { type: String, required: true },
//     doctor_advice: { type: String, required: true },
//     notes: { type: String },
class PregnancyGuideResponse {
  String? id;
  int? week;
  String? pregnancyInfo;
  String? doctorAdvice;
  String? notes;

  PregnancyGuideResponse(
      {this.id, this.week, this.pregnancyInfo, this.doctorAdvice, this.notes});

  PregnancyGuideResponse.fromJson(Map<String, dynamic> json) {
  if(json['_id'] != null) id = json['_id'].toString();
    if(json['week'] != null) week = json['week'];
    if(json['pregnancy_info'] != null) pregnancyInfo = json['pregnancy_info'];
    if(json['doctor_advice'] != null) doctorAdvice = json['doctor_advice'];
    if(json['notes'] != null) notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) data['_id'] = id;
    if (week != null) data['week'] = week;
    if (pregnancyInfo != null) data['pregnancy_info'] = pregnancyInfo;
    if (doctorAdvice != null) data['doctor_advice'] = doctorAdvice;
    if (notes != null) data['notes'] = notes;
    return data;
  }
}

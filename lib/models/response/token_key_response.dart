import 'package:peanut_app/models/request/tai_khoan_request.dart';

class TokenKeyResponse {
  TaiKhoanRequest? user;
  String? publicKey;
  String? privateKey;
  String? refreshToken;
  String? accessToken;

  TokenKeyResponse(
      {this.user,
      this.publicKey,
      this.privateKey,
      this.refreshToken,
      this.accessToken});

  TokenKeyResponse.fromJson(Map<String, dynamic> json) {
    user = (json['user'] == null)
        ? null
        : TaiKhoanRequest.fromJson(json['user'] as Map<String, dynamic>);
    publicKey = (json['publicKey'] == null)
        ? null
        : json['publicKey'].toString();
    privateKey = (json['privateKey'] == null)
        ? null
        : json['privateKey'].toString();
    refreshToken = (json['refreshToken'] == null)
        ? null
        : json['refreshToken'].toString();
    accessToken = (json['accessToken'] == null)
        ? null
        : json['accessToken'].toString();  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (user != null) data['user'] = user!.toJson();
    if (publicKey != null) data['publicKey'] = publicKey;
    if (privateKey != null) data['privateKey'] = privateKey;
    if (refreshToken != null) data['refreshToken'] = refreshToken;
    if (accessToken != null) data['accessToken'] = accessToken;
    return data;
  }
  @override
  String toString() {
    return 'TokenKey{ refreshToken: $refreshToken, accessToken: $accessToken}';
  }
}

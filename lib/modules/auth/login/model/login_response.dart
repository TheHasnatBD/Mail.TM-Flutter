/*
 * login_response, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Monday, 10/25/2021 at 10:57 PM
 */

class LoginResponse {
  String? token;
  int? code;
  String? message;

  LoginResponse({this.token, this.code, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
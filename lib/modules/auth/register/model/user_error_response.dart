/*
 * user_error_response, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Tuesday, 10/26/2021 at 1:18 AM
 */
class UserErrorResponse {
  String? type;
  String? title;
  String? detail;
  List<Violations>? violations;

  UserErrorResponse({this.type, this.title, this.detail, this.violations});

  UserErrorResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    detail = json['detail'];
    if (json['violations'] != null) {
      violations = <Violations>[];
      json['violations'].forEach((v) {
        violations!.add(new Violations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['detail'] = this.detail;
    if (this.violations != null) {
      data['violations'] = this.violations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Violations {
  String? propertyPath;
  String? message;
  dynamic code;

  Violations({this.propertyPath, this.message, this.code});

  Violations.fromJson(Map<String, dynamic> json) {
    propertyPath = json['propertyPath'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyPath'] = this.propertyPath;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}
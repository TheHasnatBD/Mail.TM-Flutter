/*
 * registration_error_response, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Monday, 10/25/2021 at 9:28 PM
 */

class RegistrationErrorResponse {
  String? context;
  String? type;
  String? hydraTitle;
  String? hydraDescription;
  List<Violations>? violations;

  RegistrationErrorResponse(
      {this.context,
        this.type,
        this.hydraTitle,
        this.hydraDescription,
        this.violations});

  RegistrationErrorResponse.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    type = json['@type'];
    hydraTitle = json['hydra:title'];
    hydraDescription = json['hydra:description'];
    if (json['violations'] != null) {
      violations = <Violations>[];
      json['violations'].forEach((v) {
        violations?.add(Violations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = this.context;
    data['@type'] = this.type;
    data['hydra:title'] = this.hydraTitle;
    data['hydra:description'] = this.hydraDescription;
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
/*
 * registration_response, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Monday, 10/25/2021 at 9:25 PM
 */

class RegistrationResponse {
  String? context;
  String? idAt;
  String? type;
  String? id;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  RegistrationResponse(
      {this.context,
        this.idAt,
        this.type,
        this.id,
        this.address,
        this.quota,
        this.used,
        this.isDisabled,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    idAt = json['@id'];
    type = json['@type'];
    id = json['id'];
    address = json['address'];
    quota = json['quota'];
    used = json['used'];
    isDisabled = json['isDisabled'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    data['@id'] = this.idAt;
    data['@type'] = this.type;
    data['id'] = this.id;
    data['address'] = this.address;
    data['quota'] = this.quota;
    data['used'] = this.used;
    data['isDisabled'] = this.isDisabled;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}


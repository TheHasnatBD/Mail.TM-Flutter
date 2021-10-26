/*
 * data_services, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */
import 'dart:convert';
import 'package:mailtm/app/util/constants.dart';
import 'package:mailtm/app/util/helper.dart';
import 'package:mailtm/modules/auth/login/model/login_response.dart';
import 'package:mailtm/modules/auth/register/model/registration_response.dart';
import 'package:mailtm/modules/domains/model/domain_response.dart';
import 'package:http/http.dart' as http;
import 'package:mailtm/modules/message/model/message_response.dart';

class DataServices{
  static var client = http.Client();

  // headers for different purpose of different API access
  static var headersJson = <String, String>{
    'Content-Type': 'application/json',
  };
  static var headersIdJson = <String, String>{
    'Content-Type': 'application/ld+json',
  };
  static var headersIdJsonWithToken = <String, String>{
    'Content-Type': 'application/ld+json',
    'Authorization': 'Bearer ${Helper.getPreferenceValue(key: Constants.TOKEN_KEY)}',
  };

  /// get mail server domain list
  Future<DomainResponse?> getDomains() async {
    var response = await client.get(Uri.parse(Constants.DOMAIN_LIST_API));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = json.decode(jsonString);
      DomainResponse _response = DomainResponse.fromJson(data);
      print(_response.toString());
      return _response;
    }
  } // getDomains

  /// create new account under a mail server
  Future<dynamic> createNewAccount(String emailAddress, String password) async {
    String _body = json.encode({
      'address': emailAddress,
      'password': password,
    });

    var response = await client.post(Uri.parse(Constants.CREATE_ACCOUNT_API),
        body: _body,
        headers: headersJson
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      var jsonString = response.body;
      var data = json.decode(jsonString);
      RegistrationResponse _response = RegistrationResponse.fromJson(data);
      print(_response.toString());
      return _response;
    } else if (response.statusCode == 400) {
      Helper.showSimpleSnackBar(msg: "Invalid input");
      return "Invalid input";
    } else if (response.statusCode == 422) {
      Helper.showSimpleSnackBar(msg: "Unprocessable entity");
      return "Unprocessable entity";
    } else {
      print("Error= ${response.statusCode}, ${response.body}");
      Helper.showSimpleSnackBar(msg: "Unknown error");
      return "Unknown error";
    }
  } // createNewAccount

  /// get JWT auth token to access user message
  Future<dynamic> getLoginToken(String emailAddress, String password) async {
    print("emailAddress= $emailAddress, password= $password");
    var response = await client.post(Uri.parse(Constants.LOGIN_API),
        headers: headersJson,
        body: jsonEncode(<String, String>{
          'address': emailAddress,
          'password': password,
        })
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var data = json.decode(jsonString);
      LoginResponse _response = LoginResponse.fromJson(data);
      print(_response.token);
      return _response;
    } else {
      // do more error handling...
      Helper.showSimpleSnackBar(msg: "Something went wrong");
      print("Error:= ${response.statusCode}, ${response.body}");
      return "Error";
    }
  } // getLoginToken


  /// get message list from an authenticated user
  Future<MessageResponse?> getHydraMessages() async {
    var response = await client.get(
        Uri.parse(Constants.MESSAGE_LIST_API),
        headers: headersIdJsonWithToken
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = response.body;
      var data = json.decode(jsonString);
      MessageResponse _response = MessageResponse.fromJson(data);

      print(response.statusCode.toString() + "data= " + _response.toString());
      return _response;
    }
  } // getHydraMessages


}

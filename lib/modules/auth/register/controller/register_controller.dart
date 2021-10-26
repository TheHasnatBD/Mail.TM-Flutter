/*
 * domain_controller, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */

import 'package:get/get.dart';
import 'package:mailtm/app/util/app_routes.dart';
import 'package:mailtm/app/util/data_services.dart';
import 'package:mailtm/app/util/helper.dart';
import 'package:mailtm/modules/auth/register/model/registration_error_response.dart';
import 'package:mailtm/modules/auth/register/model/registration_response.dart';



class RegisterController extends GetxController{
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

  }


  void createAccount(String userName, String suffixDomain, String password) async{
    try{
      var email = userName + suffixDomain;
      if(userName.isEmpty || password.isEmpty){
        this.isLoading.value = false;
        Helper.showSimpleSnackBar(msg: "Username & password are required");
        return;
      } else if(!email.isEmail){
        this.isLoading.value = false;
        Helper.showSimpleSnackBar(msg: "Email format is invalid");
        return;
      } else if(password.length < 6){
        Helper.showSimpleSnackBar(msg: "Minimum 6 digit password required");
        return;
      } else {

        this.isLoading.value = true;
        var data = await DataServices().createNewAccount(email, password);
        if (data != null) {
          if(data is RegistrationResponse){
            print(data.toString());
            Helper.showSimpleSnackBar(msg: "Account created");
            Get.back();
            Get.toNamed(AppRoutes.LOGIN);
          } else if(data is RegistrationErrorResponse){
            // need to work
            /// for time limitation, we will do this later
            print(data.toString());
          }
          this.isLoading.value = false;
        }
      }
    } catch(e){
      print("error= $e");
    }


  }



}
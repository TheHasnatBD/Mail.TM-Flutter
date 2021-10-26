/*
 * domain_controller, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Sunday, 10/24/2021 at 10:22 PM
 */

import 'package:get/get.dart';
import 'package:mailtm/app/util/app_routes.dart';
import 'package:mailtm/app/util/constants.dart';
import 'package:mailtm/app/util/data_services.dart';
import 'package:mailtm/app/util/helper.dart';
import 'package:mailtm/modules/auth/login/model/login_response.dart';


class LoginController extends GetxController{
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

  }


  // metalunits.com
  void logIn(String email, String password) async{
    try{
      if(email.isEmpty || password.isEmpty){
        this.isLoading.value = false;
        Helper.showSimpleSnackBar(msg: "Email and password are required");
        return;
      } else if(!email.isEmail){
        this.isLoading.value = false;
        Helper.showSimpleSnackBar(msg: "Email format is invalid");
        return;
      } else if(password.length < 6){
        Helper.showSimpleSnackBar(msg: "Minimum 6 digit required for password");
        return;
      } else {
        this.isLoading.value = true;
        var data = await DataServices().getLoginToken(email, password);
        if (data != null) {
          if(data is LoginResponse){
            if(data.token == null || data.token!.isEmpty){
              Helper.showSimpleSnackBar(msg: "Something went wrong. Try again later");
              return;
            }

            Helper.storePreferenceValue(key: Constants.TOKEN_KEY, value: data.token!);
            Helper.storePreferenceValue(key: Constants.DOMAIN_KEY, value: email);

            Helper.showSimpleSnackBar(msg: "You're logged in, $email");
            Get.offAllNamed(AppRoutes.HOME);
          } else {
            //Helper.showSimpleSnackBar(msg: "You're not logged in, $email");
            print("log in Error");
          }
          this.isLoading.value = false;

        }
      }

    } catch(e){
      print("error= $e");
    }


  }



}
/*
 * domain_controller, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */

import 'package:get/get.dart';
import 'package:mailtm/app/util/constants.dart';
import 'package:mailtm/app/util/data_services.dart';
import 'package:mailtm/app/util/helper.dart';
import 'package:mailtm/modules/message/model/message_response.dart';

class MessageController extends GetxController{
  var messageHydraList = <HydraMember>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    var token = Helper.getPreferenceValue(key: Constants.TOKEN_KEY);
    if(token == null || token == ""){
      print("null token");
      Get.back();
    }

    fetchMessagesHydra();
  }

  void fetchMessagesHydra() async{
    try{
      this.isLoading.value = true;
      var data = await DataServices().getHydraMessages();
      if (data != null) {
        this.messageHydraList.value = data.hydraMember!;
        this.isLoading.value = false;
      }
    } catch(e){
      print("error= $e");
    }
  }



}
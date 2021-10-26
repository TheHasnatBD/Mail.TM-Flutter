/*
 * domain_controller, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */

import 'package:get/get.dart';
import 'package:mailtm/app/util/data_services.dart';
import 'package:mailtm/modules/domains/model/domain_response.dart';


class DomainController extends GetxController{
  var domainResponse = DomainResponse().obs;
  var domainList = <HydraMember>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDomainList();
  }


  void fetchDomainList() async{
    try{
      this.isLoading.value = true;
      var data = await DataServices().getDomains();
      if (data != null) {
        this.domainResponse.value = data;
        this.domainList.value = data.hydraMember!;
        this.isLoading.value = false;
      }
    } catch(e){
      print("error= $e");
    }


  }



}
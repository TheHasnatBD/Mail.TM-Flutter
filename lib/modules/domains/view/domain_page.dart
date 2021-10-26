/*
 * domain_page, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */

import 'package:flutter/material.dart';
import 'package:mailtm/app/util/app_routes.dart';
import 'package:mailtm/app/util/constants.dart';
import 'package:mailtm/app/util/helper.dart';
import 'package:mailtm/modules/domains/controller/domain_controller.dart';
import 'package:get/get.dart';

class DomainPage extends StatelessWidget {
  final DomainController _domainController = Get.put(DomainController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
            text: const TextSpan(
              text: 'Mail',
              style: TextStyle(letterSpacing: 3, color: Colors.yellow),
              //style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: '.',
                ),
                TextSpan(
                    text: 'TM',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70)),
              ],
            ),
          ),
        ),
        body: _domainController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _domainController.domainList.value.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var object = _domainController.domainList.value[index];
            return ListTile(
              onTap: () {
                var token = Helper.getPreferenceValue(key: Constants.TOKEN_KEY);
                print("token= $token");
                if(token == null || token == ""){
                  Get.toNamed(AppRoutes.REGISTER, arguments: {
                    Constants.DOMAIN_KEY: object.domain!
                  });
                  return;
                } else {
                  Get.toNamed(AppRoutes.CHECK_MESSAGE);
                }
              },
              title: Text(object.domain!),
              subtitle: Text(object.type!),
              leading: CircleAvatar(child: Text((index + 1).toString())),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            );
          },
        ),
      );
    });
  }
}

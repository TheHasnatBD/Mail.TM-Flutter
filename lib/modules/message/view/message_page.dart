/*
 * domain_page, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Sunday, 10/24/2021 at 10:14 PM
 */

import 'package:flutter/material.dart';
import 'package:mailtm/app/util/constants.dart';
import 'package:mailtm/app/util/helper.dart';
import 'package:get/get.dart';
import 'package:mailtm/modules/message/controller/message_controller.dart';

class MessagePage extends StatelessWidget {
  final MessageController _messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
            text: const TextSpan(
              text: 'Inbox ',
              style: TextStyle(letterSpacing: 2, color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                    text: ' Mail.TM',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white70)),
              ],
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Helper.removePreferenceValue(key: Constants.TOKEN_KEY);
                Get.back();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
        body: _messageController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : (_messageController.messageHydraList.value.length > 0
                ? ListView.builder(
                    itemCount: _messageController.messageHydraList.value.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var object =
                          _messageController.messageHydraList.value[index];

                      return ExpansionTile(
                        title: Text(
                          object.subject!,
                        ),
                        leading: const Icon(Icons.label_important_outline),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              'from ${object.from!.address!.trim()}',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white70),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(object.createdAt!,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white38)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(object.intro!,
                                style: const TextStyle(fontSize: 15)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  )
                : const Center(child: Text("You have no messages", style: TextStyle(fontSize: 15),))),
      );
    });
  }
}

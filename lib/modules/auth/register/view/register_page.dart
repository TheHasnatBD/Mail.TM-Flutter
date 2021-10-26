/*
 * domain_page, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */

import 'package:flutter/material.dart';
import 'package:mailtm/app/util/constants.dart';
import 'package:mailtm/modules/auth/login/view/login_page.dart';
import 'package:mailtm/modules/auth/register/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  String domain = Get.arguments[Constants.DOMAIN_KEY] ?? "";

  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();

  final RegisterController _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var _emailSuffix = "@" + domain;

    return Obx(() {
      return Scaffold(
          body: ListView(
        clipBehavior: Clip.none,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: RichText(
                text: const TextSpan(
                  text: 'Mail',
                  style: TextStyle(
                      letterSpacing: 3, color: Colors.yellow, fontSize: 30),
                  children: <TextSpan>[
                    TextSpan(
                      text: '.',
                    ),
                    TextSpan(
                        text: 'TM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 30)),
                  ],
                ),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: const Text(
                'Create an account',
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: TextField(
              controller: address,
              decoration: InputDecoration(
                enabled: _controller.isLoading.value ? false : true,
                border: const OutlineInputBorder(),
                labelText: 'Email',
                suffix: Text(_emailSuffix),
                hintText: 'Your username',
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: TextField(
              enabled: _controller.isLoading.value ? false : true,
              //obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Give a password',
              ),
            ),
          ),
          _controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox(
                  height: 40,
                ),
          Container(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 42),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                child: const Text(
                  'REGISTER',
                  style: TextStyle(letterSpacing: 3),
                ),
                onPressed: () {
                  _controller.isLoading.value
                      ? null
                      : _controller.createAccount(address.text.trim(),
                          _emailSuffix, password.text.trim());
                },
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            child: const Text(
              'Have an account? Sign In',
              style: TextStyle(fontSize: 17, color: Colors.white70),
            ),
            onPressed: () {
              Get.back();
              Get.to(LoginPage());
            },
          )
        ],
      ));
    });
  }
}

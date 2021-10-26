/*
 * domain_page, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 * Created Sunday, 10/24/2021 at 10:14 PM
 */

import 'package:flutter/material.dart';
import 'package:mailtm/modules/auth/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();

  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
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
                'Welcome back',
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: TextField(
              controller: address,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Registered address',
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Type password',
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
                  'Login',
                  style: TextStyle(letterSpacing: 3),
                ),
                onPressed: () {
                  _controller.logIn(address.text, password.text);
                },
              )),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Hello Ltd © ${DateTime.now().year}',
              style: const TextStyle(fontSize: 12, color: Colors.white38),
            ),
          ),
        ],
      ));
    });
  }
}

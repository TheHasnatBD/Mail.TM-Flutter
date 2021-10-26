/*
 * helper, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Helper{

  /// show simple bottom snack bar passing a just string
  static showSimpleSnackBar({required String msg}){
    Get.rawSnackbar(
      backgroundColor: Colors.black.withOpacity(0.5),
      message: msg,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// GetStorage => write value under a key
  static storePreferenceValue({required String key, required String value}){
    final box = GetStorage();
    box.write(key, value);
  }

  /// GetStorage => remove value by a key
  static removePreferenceValue({required String key}){
    final box = GetStorage();
    box.remove(key);
  }

  /// GetStorage => read value by a key
  static dynamic getPreferenceValue({required String key}){
    final box = GetStorage();
    return box.read(key);
  }

}
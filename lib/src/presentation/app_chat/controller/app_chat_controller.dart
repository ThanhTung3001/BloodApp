import 'package:app/src/data/api/auth_client/auth_client.dart';
import 'package:app/src/data/api/auth_client/user_data_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppChatController extends GetxController {
  Rx<ResponseUserDataInfo> userInfo = ResponseUserDataInfo().obs;

  Future<void> fetchDataUser() async {
    try {
      var response = await AuthClient().getListUserInfo();
      userInfo(response);
    } catch (e) {
      Get.snackbar(
        'Notification',
        'Get data user fail!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchDataUser();
    super.onInit();
  }
}

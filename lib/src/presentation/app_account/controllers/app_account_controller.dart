import 'dart:io';

import 'package:app/src/data/api/auth_client/auth_client.dart';
import 'package:app/src/data/api/auth_client/auth_recognization.dart';
import 'package:app/src/data/api/auth_client/auth_user_info_update.dart';
import 'package:app/src/presentation/app_auth/controller/app_auth_controller.dart';
import 'package:app/src/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_account_info_screen.dart';

class AppAccountController extends GetxController {
  AppAccountController({required this.handlerLoading});
  Function handlerLoading;
  Rx<bool> loading = false.obs;
  final _controller = Get.put(AppAuthenController());
  Rx<ResponseReconizeID> verifyInfo = ResponseReconizeID().obs;
  Future<void> verifyAccount(File file) async {
    try {
      handlerLoading();
      var response = await AuthClient().GetInfoFromCard(file: file);
      verifyInfo(response);
      print(response.toJson());
      if (response.data == null) {
        Get.snackbar(
          'Notification',
          'Get Info fail, try again!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.grey[600],
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else {
        Get.to(() => AccountInfoICCIDSreen(model: response));
      }

      handlerLoading();
    } catch (e) {
      handlerLoading();
      Get.snackbar(
        'Notification',
        'Get Info fail, try again!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> acceptInfo() async {
    loading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = (prefs.getString('Token'));
    var userInfo = _controller.userInfo.value.data?.userInfo;
    var userVerify = verifyInfo.value.data?[0];
    String id = userVerify!.id!;
    var userUpdate = UserInfoUpdate(
      age: 0,
      email: userInfo?.email,
      avatar: userInfo?.avatar,
      fullName: userVerify.name,
      updateTime: DateTime.now().toString(),
      iccid: int.parse(id),
      birthDate: DateFormat("dd/mm/yyyy").parse(userVerify.dob!).toString(),
      star: 0,
      donateAmount: 0,
      totalDonate: 0,
      appUserId: userInfo?.appUserId!,
      id: userInfo?.id!,
      createUTC: DateTime.now().toString(),
      address: userVerify.address,
    );
    try {
      var response =
          await AuthClient().updateUserInfo(model: userUpdate, Token: token!);
      await _controller.setAuth(token: token, auth: true);
      print('Ok');
      Get.toNamed(AppRoutes.appHome);
      Get.snackbar(
        'Notification',
        'Verify info success!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      // ignore: empty_catches
    } catch (e) {
      Get.snackbar(
        'Notification',
        'Verify info fail try again!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      loading(false);
    }
  }
}

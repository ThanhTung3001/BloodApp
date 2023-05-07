import 'package:app/src/data/api/donate_blood_client/donate_client.dart';
import 'package:app/src/data/api/donate_blood_client/model/donate_history_model.dart';
import 'package:app/src/data/api/donate_blood_client/model/registration_hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRegistrationController extends GetxController
    with StateMixin<RegistrationHospital> {
  Rx<ResponseDetailRegistration> registration =
      ResponseDetailRegistration().obs;

  Rx<bool> loading = true.obs;

  getData(int id) async {
    try {
      var response = await DonateClient().getRegistrationById(id);
      registration(response);
    } finally {
      loading(false);
    }
  }

  initData() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await DonateClient().getRegistrationByHospital();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  changeStatus(int id, int status) async {
    try {
      await DonateClient().updateStatusRegis(id: id, status: status);
      initData();
    } catch (e) {
      Get.snackbar('Notification', 'Update status fail: ${e.toString()}',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}

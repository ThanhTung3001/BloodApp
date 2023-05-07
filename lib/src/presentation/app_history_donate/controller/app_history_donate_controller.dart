import 'package:app/src/data/api/donate_blood_client/donate_client.dart';
import 'package:app/src/data/api/donate_blood_client/model/donate_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHistoryDonateController extends GetxController
    with StateMixin<DonateHistoryModel> {
  Rx<TextEditingController> startControllerTime = TextEditingController().obs;
  Rx<TextEditingController> finishControllerTime = TextEditingController().obs;

  Future<void> initData() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await DonateClient().getHistory();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    initData();
  }
}

import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/data/api/donate_blood_client/donate_client.dart';
import 'package:app/src/data/api/donate_blood_client/model/blood_group_model.dart';
import 'package:app/src/data/api/donate_blood_client/model/donate_create_model.dart';
import 'package:app/src/data/api/donate_blood_client/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRegistrationController extends GetxController with StateMixin<Object> {
  Rx<ResponseHospitalModel> hospitalResponse = ResponseHospitalModel().obs;
  Rx<ResponseBloodGroup> bloodGroupResponse = ResponseBloodGroup().obs;
  Rx<int> capacity = 250.obs;
  RxString hospital = "".obs;
  Rx<DateTime> registrationTime = DateTime.now().obs;
  Rx<int> groupButtonSelected = 0.obs;
  Rx<int> idHospital = 0.obs;
  Rx<TextEditingController> hospitalController =
      TextEditingController(text: "").obs;
  Rx<TextEditingController> timepickerController = TextEditingController(
          text: DateFormatExtenstion.format(
              DateTime.now().add(const Duration(days: 2)).toString()))
      .obs;
  void changeValue(double newValue) {
    var valueSet = newValue.toInt();
    capacity(valueSet);
  }

  void changeHospitalName(newValue) {
    print(newValue);
    hospital(newValue);
  }

  Future<void> InitData() async {
    try {
      var responseHospital = await DonateClient().getHospital();

      var responseBloodGroup = await DonateClient().getBloodGroup();
      // print(responseBloodGroup.toJson());
      hospitalResponse(responseHospital);
      bloodGroupResponse(responseBloodGroup);
      change(responseBloodGroup, status: RxStatus.success());
    } catch (e) {
      change(e, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> submitData(DonateCreateModel data) async {
    try {
      var response = await DonateClient().submitDataDonate(data);
      Get.back();
      Get.snackbar(
        'Notification',
        'Registration donate success!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        'Notification',
        'Registration donate fail, try again!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void onInit() {
    InitData();
    super.onInit();
  }
}

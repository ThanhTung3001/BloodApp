import 'dart:convert';

import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/data/api/donate_blood_client/model/blood_group_model.dart';
import 'package:app/src/data/api/donate_blood_client/model/donate_create_model.dart';
import 'package:app/src/data/api/donate_blood_client/model/donate_history_model.dart';
import 'package:app/src/data/api/donate_blood_client/model/hospital_model.dart';
import 'package:app/src/data/api/donate_blood_client/model/registration_hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonateClient extends GetConnect {
  Future<ResponseHospitalModel> getHospital() async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/Hospital';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return ResponseHospitalModel.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ResponseHospitalModel(data: []);
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<DonateHistoryModel> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token')!;
    final headers = {'Authorization': token};
    try {
      var url = '$BASE_URL/api/Registration/GetByMe';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return DonateHistoryModel.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return DonateHistoryModel(data: []);
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<ResponseDetailRegistration> getRegistrationById(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token')!;
    final headers = {'Authorization': token};
    try {
      var url = '$BASE_URL/api/Registration/GetById/$id';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return ResponseDetailRegistration.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ResponseDetailRegistration();
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  //RegistrationHospital
  //api/Registration/UpdateStatusRegis/{id}/{status}

  Future<void> updateStatusRegis({required int id, required int status}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token')!;
    final headers = {'Authorization': token};
    try {
      var url = '$BASE_URL/api/Registration/UpdateStatusRegis/$id/$status';

      var response = await put(url, null, headers: headers);
      if (response.isOk) {
        Get.snackbar('Notification', 'Update status success',
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white);
      } else {
        throw Exception("Update status fail");
      }
    } catch (e) {
      //print(e.toString());

      // return ResponseEvent();
      rethrow;
    }
  }

  Future<RegistrationHospital> getRegistrationByHospital() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token')!;
    final headers = {'Authorization': token};
    try {
      var url = '$BASE_URL/api/Registration/GetRegistrationByHospital';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return RegistrationHospital.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return RegistrationHospital(data: []);
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<Object> submitDataDonate(DonateCreateModel data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token')!;
    final headers = {'Authorization': token};
    try {
      var url = '$BASE_URL/api/Registration/DonateBlood';
      print(url);
      var response = await post(url, data.toJson(), headers: headers);
      if (response.isOk) {
        return (json.decode(response.bodyString ?? ""));
      } else {
        return Object();
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<ResponseBloodGroup> getBloodGroup() async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/BloodGroup';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return ResponseBloodGroup.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ResponseBloodGroup(data: []);
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }
}

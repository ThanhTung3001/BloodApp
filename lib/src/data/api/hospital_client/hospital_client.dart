import 'dart:convert';

import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/data/api/hospital_client/hospital_model.dart';
import 'package:app/src/data/api/hospital_client/hospital_model_list.dart';
import 'package:get/get.dart';

class HospitalClient extends GetConnect {
  Future<HospitalResponse> getHospitalById({required int Id}) async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/Hospital/GetById/$Id';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return HospitalResponse.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return HospitalResponse();
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<ResponseHospitalList> getAllHospital() async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/Hospital';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return ResponseHospitalList.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ResponseHospitalList();
      }
    } catch (e) {
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }
}
//ResponseHospitalList
import 'dart:convert';
import 'dart:io';

import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/data/api/auth_client/auth_model.dart';
import 'package:app/src/data/api/auth_client/user_data_info.dart';
import 'package:app/src/data/api/auth_client/user_info_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'auth_recognization.dart';
import 'auth_user_info_update.dart';

class AuthClient extends GetConnect {
  // ignore: non_constant_identifier_names
  Future<ResponseAuth> authentication(
      {required String email, required String password}) async {
    // final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/Account/authenticate';
      //print(url);
      var response = await post(
        url,
        {"email": email.trim(), "password": password.trim()},
      );
      if (response.isOk) {
        return ResponseAuth.fromJson(json.decode(response.bodyString ?? ""));
      } else {
        return ResponseAuth();
      }
    } catch (e) {
      ToastCard(
          Text('Get data fail ${e.toString()}'), const Duration(seconds: 5));
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<ResponseAuth> authenticationGoogle(info) async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/Account/authenticate-google';
      //print(url);
      var response = await post(url, info, headers: headers);
      print(response.body.toString());
      if (response.isOk) {
        return ResponseAuth.fromJson(json.decode(response.bodyString ?? ""));
      } else {
        return ResponseAuth();
      }
    } catch (e) {
      print(e);
      ToastCard(
          Text('Get data fail ${e.toString()}'), const Duration(seconds: 5));
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<ReponseUserInfoPrimary> getUserInfo({required String Token}) async {
    final headers = {'Authorization': Token};
    try {
      var url = '$BASE_URL/api/Account/getMe';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return ReponseUserInfoPrimary.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ReponseUserInfoPrimary();
      }
    } catch (e) {
      ToastCard(
          Text('Get data fail ${e.toString()}'), const Duration(seconds: 5));
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<ResponseUserDataInfo> getListUserInfo() async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/UserInfo';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return ResponseUserDataInfo.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ResponseUserDataInfo();
      }
    } catch (e) {
      ToastCard(
          Text('Get data fail ${e.toString()}'), const Duration(seconds: 5));
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<ResponseReconizeID> GetInfoFromCard({required File file}) async {
    try {
      var url = 'https://api.fpt.ai/vision/idr/vnm';
      print(url);
      final FormData formData = FormData({
        'image': MultipartFile(file,
            filename: file.path.substring(file.path.lastIndexOf("/") + 1))
      });
      var response = await post(url, formData,
          headers: {"api-key": "ylm9MVQO5BvMuwV8l2bW6MDp1XSmO6vq"});
      if (response.isOk) {
        return ResponseReconizeID.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ResponseReconizeID();
      }
    } catch (e) {
      ToastCard(
          Text('Get data fail ${e.toString()}'), const Duration(seconds: 5));
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }

  Future<Object> updateUserInfo(
      {required UserInfoUpdate model, required String Token}) async {
    final headers = {'Authorization': Token};

    try {
      var url = '$BASE_URL/api/UserInfo/${model.id}';
      print(url);
      var response = await put(url, model.toJson(), headers: headers);
      print(model.toJson());
      if (response.isOk) {
        return response.body;
      } else {
        print(response.bodyString);
        throw Exception('Verify fail try again');
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Notification',
        'Verify info fail try again!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      // return ResponseEvent();
      rethrow;
    }
  }
}

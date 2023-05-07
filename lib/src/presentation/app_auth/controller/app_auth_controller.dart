import 'dart:io';
import 'package:app/src/data/api/auth_client/auth_client.dart';
import 'package:app/src/data/api/auth_client/auth_model.dart';
import 'package:app/src/data/api/file_client/file_client.dart';
import 'package:app/src/data/api/hospital_client/hospital_client.dart';
import 'package:app/src/data/api/hospital_client/hospital_model.dart';
import 'package:app/src/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/api/auth_client/auth_user_info_update.dart';
import '../../../data/api/auth_client/user_info_primary.dart';

class AppAuthenController extends GetxController with StateMixin<ResponseAuth> {
  RxBool auth = false.obs;
  RxString Token = "".obs;
  Rx<bool> loading = false.obs;
  Rx<ReponseUserInfoPrimary> userInfo = ReponseUserInfoPrimary().obs;
  Rx<File> avatarPath = File("").obs;
  Rx<bool> haveFile = false.obs;
  Rx<HospitalResponse> hospitalResponse = HospitalResponse().obs;

  void setAvatar(File file) {
    avatarPath(file);
    haveFile(true);
  }

  Future<void> InitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('Token');
    auth(token != null);
  }

  Future<String> uploadFile(String path, File file) async {
    try {
      var response = await FileClient().UploadFile(path, file);
      print(response);
      return response.data!.path!;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> Logout() async {
    Token('');
    auth(false);
    userInfo(ReponseUserInfoPrimary());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.snackbar(
      'Notification',
      'Signout sucess',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[600],
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  Future<void> setAuth({required String token, required bool auth}) async {
    this.auth(auth);
    Token(token);
    var info = await AuthClient().getUserInfo(Token: token);
    // print(info.data?.userInfo?.toJson());
    // print('info user hospital: ${info.data?.userInfo?.toJson()}');
    if (info.data?.userInfo?.hospitalId != null) {
      var responseHospital = await HospitalClient()
          .getHospitalById(Id: info.data!.userInfo!.hospitalId!);
      hospitalResponse(responseHospital);
      print('Hospital Info: ${responseHospital.toJson()}');
      Get.snackbar(
        'Notification',
        'Wellcome employee ${responseHospital.name} use app',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
    userInfo(info);
  }

  // ignore: non_constant_identifier_names
  Future Login({email, password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      loading(true);
      change(null, status: RxStatus.loading());
      var response =
          await AuthClient().authentication(email: email, password: password);
      if (response.message == null) {
        Get.snackbar(
          'Thông báo',
          'Đăng nhập thất bại, vui lòng kiểm tra lại email hoặc mật khẩu',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey[600],
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        loading(false);
      } else {
        Token("Bearer ${response.data?.jwToken}");
        setAuth(token: "Bearer ${response.data?.jwToken}", auth: true);
        // auth(true);
        loading(false);
        change(response, status: RxStatus.success());
        var info = await AuthClient().getUserInfo(Token: Token.value);
        userInfo(info);
        prefs.setString("Token", 'Bearer ${response.data?.jwToken}');
        Get.toNamed(AppRoutes.appHome);
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      Get.snackbar(
        'Thông báo',
        'Đăng nhập thất bại, vui lòng kiểm tra lại email hoặc mật khẩu',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future SignInWithGoogle({info}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      loading(true);
      change(null, status: RxStatus.loading());
      var response = await AuthClient().authenticationGoogle(info);
      if (response.message == null) {
        Get.snackbar(
          'Thông báo',
          'Đăng nhập thất bại, thử lại sau',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey[600],
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        loading(false);
      } else {
        setAuth(token: "Bearer ${response.data?.jwToken}", auth: true);
        // auth(true);
        loading(false);
        change(response, status: RxStatus.success());
        var info = await AuthClient().getUserInfo(Token: Token.value);
        userInfo(info);
        prefs.setString("Token", 'Bearer ${response.data?.jwToken}');
        Get.toNamed(AppRoutes.appHome);
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      Get.snackbar(
        'Thông báo',
        'Đăng nhập thất bại, thử lại sau',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> updateInfo(
      {required String email,
      required String address,
      required String phoneNumber,
      String? avatar}) async {
    loading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = (prefs.getString('Token'));
    var info = userInfo.value.data?.userInfo;
    var userUpdate = UserInfoUpdate(
      age: 0,
      email: email,
      avatar: avatar ?? info?.avatar,
      fullName: info?.fullName,
      updateTime: DateTime.now().toString(),
      iccid: info?.iccid,
      birthDate: info?.birthDate,
      star: info?.star,
      donateAmount: info?.donateAmount,
      totalDonate: info?.totalDonate,
      appUserId: info?.appUserId!,
      id: info?.id!,
      address: address,
      phoneNumber: phoneNumber,
      createUTC: info?.createUTC,
      hospitalId: info?.hospitalId == null ? null : info?.hospitalId.toString(),
    );
    try {
      var response =
          await AuthClient().updateUserInfo(model: userUpdate, Token: token!);
      await setAuth(token: token, auth: true);
      Get.snackbar(
        'Notification',
        'Update info success!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      // ignore: empty_catches
    } catch (e) {
      Get.snackbar(
        'Notification',
        'Update info fail try again!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      loading(false);
    }
  }

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
    InitialData();
  }
}

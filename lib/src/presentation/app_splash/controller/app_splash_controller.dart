import 'package:app/src/router/app_route.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_auth/controller/app_auth_controller.dart';

class AppSplashController extends GetxController {
  Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('Token'));
    if (prefs.getString('Token') == null) {
      Get.offAndToNamed(AppRoutes.signIn);
    } else {
      Get.offAndToNamed(AppRoutes.appHome);
      var controller = Get.put(AppAuthenController());
      controller.setAuth(token: prefs.getString('Token')!, auth: true);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkAuth();
  }
}

import 'package:get/get.dart';

import '../controller/app_splash_controller.dart';

class AppSplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppSplashController());
  }
}

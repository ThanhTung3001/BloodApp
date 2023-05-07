import 'package:get/get.dart';

import '../controller/app_auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppAuthenController());
  }
}

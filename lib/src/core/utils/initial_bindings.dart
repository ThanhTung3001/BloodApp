import 'package:app/src/presentation/app_chat/controller/app_chat_controller.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../presentation/app_auth/controller/app_auth_controller.dart';
import '../network/network_info.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(PrefUtils());
    // Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(AppAuthenController());
    Get.put(AppChatController());
  }
}

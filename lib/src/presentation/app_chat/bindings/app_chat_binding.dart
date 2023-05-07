import 'package:app/src/presentation/app_chat/controller/app_chat_controller.dart';
import 'package:get/get.dart';

class AppChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppChatController());
  }
}

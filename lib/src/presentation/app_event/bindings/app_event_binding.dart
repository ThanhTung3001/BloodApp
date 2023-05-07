import 'package:app/src/presentation/app_event/controller/app_event_controller.dart';
import 'package:get/get.dart';

class AppEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppEventController());
  }
}

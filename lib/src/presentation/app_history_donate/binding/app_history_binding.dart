import 'package:app/src/presentation/app_history_donate/controller/app_history_donate_controller.dart';
import 'package:get/get.dart';

class AppHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppHistoryDonateController());
  }
}

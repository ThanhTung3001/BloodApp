import 'package:app/src/presentation/app_registrations/controller/app_registrations_controller.dart';
import 'package:get/get.dart';

class AppRegistrationBinding implements Bindings {
  @override
  void dependencies() {
    print("BINDING");
    Get.put(AppRegistrationController());
  }
}

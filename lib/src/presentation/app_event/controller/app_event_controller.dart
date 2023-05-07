import 'package:app/src/data/api/event_client/event_model.dart';
import 'package:get/get.dart';

import '../../../data/api/event_client/event_client.dart';

class AppEventController extends GetxController with StateMixin<ResponseEvent> {
  Future<void> GetData() async {
    try {
      var response = await EventClient().getAllEvent();

      if (response.data!.isEmpty) {
        change(response, status: RxStatus.empty());
      }
      change(response, status: RxStatus.success());
    } catch (e) {
      print(e);
      RxStatus.error('Load data fail');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    GetData();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}

import 'package:app/src/data/api/event_client/event_client.dart';
import 'package:app/src/data/api/event_client/event_model.dart';
import 'package:get/get.dart';
// import 'package:permi';

class HomeController extends GetxController with StateMixin<ResponseEvent> {
  // final MyRepository repository;
  // HomeController(this.repository);

  var eventRepository = ResponseEvent().obs;

  Future<void> GetData() async {
    try {
      var response = await EventClient().getAllEvent();

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
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    dispose();
    super.onClose();
  }
}

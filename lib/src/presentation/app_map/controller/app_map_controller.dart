import 'package:app/src/data/api/hospital_client/hospital_client.dart';
import 'package:app/src/data/api/hospital_client/hospital_model_list.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMapController extends GetxController
    with StateMixin<ResponseHospitalList> {
  Rx<Set<Marker>> markers = Rx<Set<Marker>>(<Marker>{}.toSet());
  initDate() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await HospitalClient().getAllHospital();

      var marketList = response.data!
          .map(
            (e) => Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(
                double.parse(e.lat.toString()),
                double.parse(e.long.toString()),
              ),
              infoWindow: InfoWindow(
                title: e.name,
                snippet: e.address,
              ),
            ),
          )
          .toSet();
      markers(marketList);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    initDate();
    super.onInit();
  }
}

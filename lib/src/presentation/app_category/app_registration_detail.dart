import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/app_registration_employee_controller.dart';

class AppRegistrationDetails extends StatefulWidget {
  AppRegistrationDetails({super.key, required this.id});
  int id;

  @override
  State<AppRegistrationDetails> createState() => _AppRegistrationDetailsState();
}

class _AppRegistrationDetailsState extends State<AppRegistrationDetails> {
  AppRegistrationController controller = Get.put(AppRegistrationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration details",
        ),
      ),
      body: Obx(() => controller.loading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: TextFormField(
                    enabled: false,
                    initialValue: controller.registration.value.hospital?.name,
                    //enabled: false,

                    decoration: const InputDecoration(
                      labelText: 'Hospital name.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            )),
    );
  }
}

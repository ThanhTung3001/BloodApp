import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/data/api/donate_blood_client/model/donate_create_model.dart';
import 'package:app/src/presentation/app_registrations/controller/app_registrations_controller.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';

class AppDonateScreen extends GetWidget<AppRegistrationController> {
  AppDonateScreen({super.key});
  String? dropdown;

  _submit() {
    var dataSend = DonateCreateModel();
    dataSend.bloodGroupId = controller.groupButtonSelected.value;
    dataSend.capacity = controller.capacity.value;
    dataSend.registerTime = DateFormat("dd/MM/yyyy")
        .parse(controller.timepickerController.value.text)
        .toString();
    dataSend.status = 1;
    dataSend.userId = 0;
    // print(controller.hospital.value);
    dataSend.hospitalId = controller.hospitalResponse.value.data!
        .where((e) => e.name == controller.hospitalController.value.text)
        .first
        .id;
    controller.submitData(dataSend);
  }

  @override
  Widget build(BuildContext context) {
    void openDropdown() {
      DropDownState(
        DropDown(
          bottomSheetTitle: Text(
            controller.hospital.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: (controller.hospitalResponse.value.data ?? [])
              .map((e) => SelectedListItem(name: e.name ?? ""))
              .toList(),
          selectedItems: (List<SelectedListItem> selectedList) {
            // print(selectedList[0].isSelected);
            controller.hospitalController.value.text = (selectedList[0].name);
          },
          // enableMultipleSelection: true,
        ),
      ).showModal(context);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Donate Blood Registrations",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: controller.obx(
          (state) => Container(
                padding: const EdgeInsets.only(top: 20),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Registration form",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Obx(
                      () {
                        return Column(
                          children: [
                            Slider(
                              autofocus: true,
                              label: "Capacity (ml):",
                              value: controller.capacity.value.toDouble(),
                              min: 250,
                              max: 500,
                              onChanged: controller.changeValue,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${controller.capacity.value.toString()} ml",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    Obx(() {
                      return Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const Text("BloodGroup"),
                            GroupButton(
                                options: GroupButtonOptions(
                                    borderRadius: BorderRadius.circular(8)),
                                isRadio: true,
                                onSelected: (nameSelected, index, change) {
                                  // print('$index button is selected');
                                  var itemAtIndex = controller
                                      .bloodGroupResponse.value.data![index];
                                  controller.groupButtonSelected.value =
                                      itemAtIndex.id!.toInt();
                                },
                                buttons: controller
                                    .bloodGroupResponse.value.data!
                                    .map((e) => e.name)
                                    .toList())
                          ],
                        ),
                      );
                    }),
                    Obx(
                      () => InkWell(
                        onTap: openDropdown,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 8),
                          child: TextFormField(
                            enabled: false,
                            controller: controller.hospitalController.value,
                            //enabled: false,
                            //        initialValue: controller.hospital.value,
                            decoration: const InputDecoration(
                              labelText: 'Hospital name.',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime:
                                  DateTime.now().add(const Duration(days: 2)),

                              //  maxTime:  DateTime.now(),

                              onConfirm: (date) {
                            controller.timepickerController.value.text =
                                DateFormatExtenstion.format(date.toString());
                            print(DateFormat("dd/MM/yyyy").parse(
                                controller.timepickerController.value.text));
                          },
                              currentTime: DateFormat("dd/MM/yyyy").parse(
                                  controller.timepickerController.value.text),
                              locale: LocaleType.en);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          child: TextFormField(
                            enabled: false,
                            controller: controller.timepickerController.value,
                            //enabled: false,

                            decoration: const InputDecoration(
                              labelText: 'Registration date.',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: GFButton(
                        size: GFSize.LARGE,
                        onPressed: _submit,
                        text: "Submit",
                      ),
                    )
                  ],
                ),
              ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}

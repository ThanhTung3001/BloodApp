import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'controller/app_registration_employee_controller.dart';

class RegistrationsEmployee extends GetView<AppRegistrationController> {
  RegistrationsEmployee({super.key});
  final _refreshController = RefreshController(initialRefresh: false);
  @override
  AppRegistrationController get controller =>
      Get.put(AppRegistrationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donate registration",
        ),
      ),
      body: controller.obx(
        (state) => Container(
          margin: const EdgeInsets.only(top: 20),
          child: SmartRefresher(
            controller: _refreshController,
            enablePullUp: true,
            onRefresh: () {
              controller.initData();
              _refreshController.refreshCompleted();
            },
            child: ListView(
                children: state!.data!
                    .map((e) => SizedBox(
                          height: 85,
                          child: GFListTile(
                            onTap: () {},
                            title: Text(
                              "No: ${e.id.toString()}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subTitle: Text(
                                ' ${DateFormatExtenstion.format(e.registerTime)}'),
                            avatar: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 500,
                                      width: Get.width,
                                      child: AlertDialog(
                                        title: Text("No: ${e.id}"),
                                        content: SizedBox(
                                          height: 500,
                                          width: Get.width,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  width: Get.width,
                                                  // height: 250,f
                                                  child: AspectRatio(
                                                    aspectRatio: 1.0,
                                                    child: AppImageNetwork(
                                                      url: BASE_URL +
                                                          (e.qrCode ?? ""),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16),
                                                  child: Text.rich(
                                                      TextSpan(children: [
                                                    const TextSpan(
                                                      text: "FullName: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                        text: e
                                                            .userInfo!.fullName)
                                                  ])),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8,
                                                  ),
                                                  child: Text.rich(
                                                      TextSpan(children: [
                                                    const TextSpan(
                                                      text: "UID: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                        text: e.userInfo!.iccid
                                                            .toString())
                                                  ])),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8,
                                                  ),
                                                  child: Text.rich(
                                                      TextSpan(children: [
                                                    const TextSpan(
                                                      text: "Weight: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                        text: e.userInfo!
                                                                    .weight ==
                                                                0
                                                            ? "Not yet update!"
                                                            : "${e.userInfo!.weight.toString()} kg")
                                                  ])),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Text.rich(
                                                      TextSpan(children: [
                                                    const TextSpan(
                                                      text: "Hospital: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                        text: e.hospital!.name)
                                                  ])),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Text.rich(
                                                      TextSpan(children: [
                                                    const TextSpan(
                                                      text: "Capacity: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "${e.capacity.toString()} ml",
                                                      style: const TextStyle(
                                                          color: Colors.red),
                                                    )
                                                  ])),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Text.rich(
                                                      TextSpan(children: [
                                                    const TextSpan(
                                                      text: "Bloodgroup: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                      text: e.bloodGroup!.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    )
                                                  ])),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Text.rich(TextSpan(
                                                      children: [
                                                        WidgetSpan(
                                                            child: Row(
                                                          children: [
                                                            const Text(
                                                              "Status: ",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            Builder(builder:
                                                                (context) {
                                                              switch (
                                                                  e.status) {
                                                                case 1:
                                                                  return Container(
                                                                    padding: const EdgeInsets.all(8).copyWith(
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .grey,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Just Register",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  );
                                                                case 2:
                                                                  return Container(
                                                                    padding: const EdgeInsets.all(8).copyWith(
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .orange,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Accept Register",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  );
                                                                case 3:
                                                                  return Container(
                                                                    padding: const EdgeInsets.all(8).copyWith(
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Processing",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  );
                                                                case 4:
                                                                  return Container(
                                                                    padding: const EdgeInsets.all(8).copyWith(
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .green,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Finish",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  );
                                                                case 5:
                                                                  return Container(
                                                                    padding: const EdgeInsets.all(8).copyWith(
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .redAccent,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Rejected",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  );
                                                                default:
                                                                  return Container(
                                                                    color: Colors
                                                                        .grey,
                                                                    child: const Text(
                                                                        "Just Register"),
                                                                  );
                                                              }
                                                            }),
                                                          ],
                                                        )),
                                                      ])),
                                                )
                                              ]),
                                        ),
                                        actions: const [],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(8)),
                                height: 60,
                                width: 60,
                                child: AppImageNetwork(
                                    // ignore: unnecessary_null_comparison
                                    url: (BASE_URL + (e.qrCode ?? "")),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            icon: InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                    Container(
                                      child: Wrap(
                                        children: <Widget>[
                                          e.status == 2
                                              ? Container()
                                              : ListTile(
                                                  leading: const Icon(
                                                      Icons.add_circle_sharp),
                                                  title: const Text('Accept'),
                                                  onTap: () {
                                                    controller.changeStatus(
                                                        e.id!, 2);
                                                    Get.back();
                                                    // Get.context.();
                                                  }),
                                          e.status == 3
                                              ? Container()
                                              : ListTile(
                                                  leading: const Icon(Icons
                                                      .wifi_protected_setup_sharp),
                                                  title:
                                                      const Text('Processing'),
                                                  onTap: () {
                                                    controller.changeStatus(
                                                        e.id!, 3);
                                                    Get.back();
                                                  },
                                                ),
                                          e.status == 5
                                              ? Container()
                                              : ListTile(
                                                  leading:
                                                      const Icon(Icons.cancel),
                                                  title: const Text('Rejected'),
                                                  onTap: () {
                                                    controller.changeStatus(
                                                        e.id!, 5);
                                                    Get.back();
                                                  },
                                                ),
                                        ],
                                      ),
                                    ),
                                    backgroundColor: Colors.white);
                              },
                              child: Builder(builder: (context) {
                                switch (e.status) {
                                  case 1:
                                    return Container(
                                      padding: const EdgeInsets.all(8)
                                          .copyWith(left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        "Just Register",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  case 2:
                                    return Container(
                                      padding: const EdgeInsets.all(8)
                                          .copyWith(left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        "Accept Register",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  case 3:
                                    return Container(
                                      padding: const EdgeInsets.all(8)
                                          .copyWith(left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        "Processing",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  case 4:
                                    return Container(
                                      padding: const EdgeInsets.all(8)
                                          .copyWith(left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        "Finish",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  case 5:
                                    return Container(
                                      padding: const EdgeInsets.all(8)
                                          .copyWith(left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        "Rejected",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  default:
                                    return Container(
                                      color: Colors.grey,
                                      child: const Text("Just Register"),
                                    );
                                }
                              }),
                            ),
                            margin: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 0),
                            color: Colors.white,
                          ),
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}

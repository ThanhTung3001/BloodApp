import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/presentation/app_history_donate/controller/app_history_donate_controller.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:group_button/group_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppHistoryDonateScreen extends GetWidget<AppHistoryDonateController> {
  AppHistoryDonateScreen({super.key});

  final _refreshController = RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                  Container(
                      padding: const EdgeInsets.all(16).copyWith(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width,
                            // padding: const EdgeInsets.only(bottom: 16),
                            child: const Text(
                              "Filter History",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const Divider(color: Colors.grey),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            width: Get.width,
                            child: const Text(
                              "Status",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width,
                            child: GroupButton(
                                options: GroupButtonOptions(
                                    borderRadius: BorderRadius.circular(8)),
                                isRadio: true,
                                onSelected: (nameSelected, index, change) {
                                  // print('$index button is selected');
                                  // var itemAtIndex = controller
                                  //     .bloodGroupResponse.value.data![index];
                                  // controller.groupButtonSelected.value =
                                  //     itemAtIndex.id!.toInt();
                                },
                                buttons: const [
                                  "All Status",
                                  "Register",
                                  "Accept",
                                  "Processing",
                                  "Finish",
                                  "Rejected"
                                ]),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            width: Get.width,
                            child: const Text(
                              "Date Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                      enabled: false,
                                      controller:
                                          controller.startControllerTime.value,
                                      //enabled: false,

                                      decoration: const InputDecoration(
                                        labelText: 'Start Time.',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                      enabled: false,
                                      controller:
                                          controller.startControllerTime.value,
                                      //enabled: false,

                                      decoration: const InputDecoration(
                                        labelText: 'End Time.',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: GFButton(
                              fullWidthButton: true,
                              size: GFSize.LARGE,
                              onPressed: () {},
                              text: "Search",
                            ),
                          )
                        ],
                      )),
                  backgroundColor: Colors.white);
            },
            icon: const Icon(
              Icons.filter_alt_rounded,
              color: Colors.black,
            ),
          )
        ],
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
          "History donate",
          style: TextStyle(color: Colors.black),
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
                                                      BorderRadius.circular(8),
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
                                                padding: const EdgeInsets.only(
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
                                                      text:
                                                          e.userInfo!.fullName)
                                                ])),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                                padding: const EdgeInsets.only(
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
                                                padding: const EdgeInsets.only(
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
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text.rich(
                                                    TextSpan(children: [
                                                  WidgetSpan(
                                                      child: Row(
                                                    children: [
                                                      const Text(
                                                        "Status: ",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      Builder(
                                                          builder: (context) {
                                                        switch (e.status) {
                                                          case 1:
                                                            return Container(
                                                              padding: const EdgeInsets
                                                                      .all(8)
                                                                  .copyWith(
                                                                      left: 16,
                                                                      right:
                                                                          16),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: const Text(
                                                                "Just Register",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            );
                                                          case 2:
                                                            return Container(
                                                              padding: const EdgeInsets
                                                                      .all(8)
                                                                  .copyWith(
                                                                      left: 16,
                                                                      right:
                                                                          16),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .orange,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: const Text(
                                                                "Accept Register",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            );
                                                          case 3:
                                                            return Container(
                                                              padding: const EdgeInsets
                                                                      .all(8)
                                                                  .copyWith(
                                                                      left: 16,
                                                                      right:
                                                                          16),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: const Text(
                                                                "Processing",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            );
                                                          case 4:
                                                            return Container(
                                                              padding: const EdgeInsets
                                                                      .all(8)
                                                                  .copyWith(
                                                                      left: 16,
                                                                      right:
                                                                          16),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: const Text(
                                                                "Finish",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            );
                                                          case 5:
                                                            return Container(
                                                              padding: const EdgeInsets
                                                                      .all(8)
                                                                  .copyWith(
                                                                      left: 16,
                                                                      right:
                                                                          16),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .redAccent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: const Text(
                                                                "Rejected",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            );
                                                          default:
                                                            return Container(
                                                              color:
                                                                  Colors.grey,
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
                            title: Text(
                              "No: ${e.id.toString()}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subTitle: Text(
                                ' ${DateFormatExtenstion.format(e.registerTime)}'),
                            avatar: Container(
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
                            icon: Builder(builder: (context) {
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

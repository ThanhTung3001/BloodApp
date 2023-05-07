import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/data/api/event_client/event_model.dart';
import 'package:app/src/presentation/app_event/controller/app_event_controller.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
import '../../theme/color_constants.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AppEventDetails extends GetWidget<AppEventController> {
  AppEventDetails({super.key, required this.data});

  // var eventController = Get.put(AppEventController());
  Data data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Detail event",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: SizedBox(
                  height: 250,
                  child: AppImageNetwork(
                    url: data.avatar ?? "",
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8).copyWith(top: 16),
              child: Text(
                data.title ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8).copyWith(top: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.green,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "${DateFormatExtenstion.format(data.startTime)} - ${DateFormatExtenstion.format(data.finishTime)}",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                          height: 1.3),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                data.description ?? "",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: GFButton(
                onPressed: () => {},
                text: "Subcribe event",
                textStyle: const TextStyle(fontWeight: FontWeight.w700),
                size: GFSize.LARGE,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8),
            //   child: SizedBox(
            //     // height: 320,
            //     child: controller.obx(
            //       (state) => CarouselSlider(
            //         options: CarouselOptions(
            //           height: 280,
            //           // aspectRatio: 16 / 9,
            //           autoPlay: true,
            //           viewportFraction: 0.8,
            //           aspectRatio: 2.0,
            //           // enlargeCenterPage: true,
            //         ),
            //         items: ((state!.data ?? [])
            //             .where((item) => item.id != data.id)).map((e) {
            //           return Builder(
            //             builder: (BuildContext context) {
            //               return InkWell(
            //                 onTap: () {
            //                   // print('tapp');
            //                   Get.back();
            //                   Get.to(() => AppEventDetails(data: e));
            //                 },
            //                 child: Container(
            //                   // height: 0q,
            //                   margin: const EdgeInsets.all(8),
            //                   child: CardEvent(
            //                     img: e.avatar ?? "",
            //                     title: e.title ?? "",
            //                     id: e.id ?? 0,
            //                     date: e.startTime ?? "",
            //                   ),
            //                 ),
            //               );
            //             },
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

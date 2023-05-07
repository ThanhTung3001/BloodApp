import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';

import '../../../widgets/app_image_network.dart';

// ignore: non_constant_identifier_names
Container CardEvent({
  required String img,
  required String title,
  required int id,
  required String date,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    //  width: Get.width,
    height: 250,
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
    child: Column(
      children: [
        SizedBox(
          width: Get.width,
          height: 170,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AppImageNetwork(
                borderRadius: BorderRadius.circular(0),
                url: img,
              )),
        ),
        Container(
            padding: const EdgeInsets.all(
              16,
            ).copyWith(top: 8, bottom: 0),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  // color: Colors.red,
                  width: Get.width,
                  //  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 8),
                          //width: 50,
                          // height: 20,
                          // color: Colors.red,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.green,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                DateFormatExtenstion.format(date),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )),
                      GFButton(
                        size: GFSize.LARGE,
                        color: Colors.green,
                        onPressed: () {},
                        text: 'Subcribe',
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ],
    ),
  );
}

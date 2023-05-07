import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/data/api/blog_client/blog_model.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppBlogDetailsScreen extends StatelessWidget {
  AppBlogDetailsScreen({super.key, required this.data});
  SingleDataBlog data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              height: 250,
              child: AppImageNetwork(
                url: data.avatar!,
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16).copyWith(bottom: 8),
              child: Text(
                data.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              child: Text(
                DateFormatExtenstion.format(data.publicTime),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              child: Text(
                data.description!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              child: Text(
                data.content!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              child: Text(
                "Author: ${data.createBy!}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

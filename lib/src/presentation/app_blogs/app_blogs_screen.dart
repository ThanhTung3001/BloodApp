import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/presentation/app_blogs/app_blog_detail_screen.dart';
import 'package:app/src/presentation/app_blogs/controller/app_blog_controller.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppBlogScreen extends GetView<AppBlogController> {
  AppBlogScreen({super.key});
  final _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogs"),
      ),
      body: controller.obx(
        ((state) => SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              enablePullDown: true,
              onRefresh: () async {
                await controller.initData();
                _refreshController.refreshCompleted();
              },
              onLoading: () {
                _refreshController.loadComplete();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...(state)!
                        .data!
                        .map((e) => GFListTile(
                              onTap: () {
                                Get.to(() => AppBlogDetailsScreen(
                                      data: e,
                                    ));
                              },
                              color: Colors.white,
                              avatar: SizedBox(
                                height: 60,
                                width: 60,
                                child: AppImageNetwork(
                                  url: e.avatar!,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              title: Text(
                                e.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.5),
                              ),
                              subTitle: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  DateFormatExtenstion.format(e.publicTime),
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ))
                        .toList()
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

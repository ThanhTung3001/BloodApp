import 'package:app/src/presentation/app_event/controller/app_event_controller.dart';
import 'package:app/src/presentation/app_event/event_details.dart';
import 'package:app/src/presentation/app_home/widgets/card_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

class AppEventScreen extends GetWidget<AppEventController> {
  AppEventScreen({super.key});
  Future<void> _onRefresh() async {
    try {
      await controller.GetData();
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  final _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16).copyWith(top: 20),
        child: SmartRefresher(
            enablePullUp: true,
            onRefresh: _onRefresh,
            controller: _refreshController,
            child: controller.obx(
              (state) => ListView(
                children: [
                  ...((state?.data ?? []).map(
                    (e) => InkWell(
                      onTap: () => Get.to(() => AppEventDetails(
                            data: e,
                          )),
                      child: CardEvent(
                        img: e.avatar ?? "",
                        title: e.title ?? "",
                        date: e.startTime ?? "",
                        id: e.id ?? 0,
                      ),
                    ),
                  ))
                ],
              ),
              onEmpty: SizedBox(
                height: 300,
                child: Center(
                    child: GFButton(
                  onPressed: () {
                    controller.GetData();
                  },
                  text: 'Data empty, try again',
                )),
              ),
              onError: (error) => SizedBox(
                height: 300,
                child: Center(
                    child: GFButton(
                  onPressed: () {
                    controller.GetData();
                  },
                  text: error.toString(),
                )),
              ),
              onLoading: const SizedBox(
                height: 300,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            )),
      ),
    );
  }
}

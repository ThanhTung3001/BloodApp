import 'package:app/src/presentation/app_event/event_details.dart';
import 'package:app/src/presentation/app_home/controller/home_controller.dart';
import 'package:app/src/presentation/app_home/widgets/card_event.dart';
import 'package:app/src/presentation/app_home/widgets/category_widget.dart';
import 'package:app/src/presentation/app_home/widgets/search_widget.dart';
import 'package:app/src/theme/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../layout/custom_appbar/app_custom_appbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});

  var scrollController = ScrollController();
  final _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await controller.GetData();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      //   appBar: const AppBarCustom(),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 30,
          pinned: true, snap: false, floating: true,
          // floating: true,
          expandedHeight: 150.0,
          collapsedHeight: 30,
          bottom: const SearchWidget(),
          flexibleSpace: AppBarCustom(),
          // flexibleSpace: AppBarCustom(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: Get.height - 100,
              // your child widget goes here
              child: SmartRefresher(
                controller: _refreshController,
                enablePullUp: true,
                onRefresh: _onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CategoryWidget(),
                      Container(
                        // color: Colors.red,
                        width: Get.width,
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 0),
                        child: controller.obx(
                          (state) => Column(
                            children: [
                              ...(state?.data) == null
                                  ? []
                                  : (state?.data)!.map(
                                      (e) => InkWell(
                                        onTap: () {
                                          Get.to(() => AppEventDetails(
                                                data: e,
                                              ));
                                        },
                                        child: CardEvent(
                                          img: e.avatar ?? "",
                                          title: e.title ?? "",
                                          date: e.startTime ?? "",
                                          id: e.id ?? 0,
                                        ),
                                      ),
                                    )
                            ],
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

/*

      [
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: CategoryWidget(),
            ),
            Container(
                // color: Colors.red,
                width: Get.width,
                margin: const EdgeInsets.only(left: 16, right: 16, top: 0),
                child: Obx(
                  () => Column(
                    children: [
                      ...(controller.eventRepository.value.data) == null
                          ? []
                          : (controller.eventRepository.value.data)!.map(
                              (e) => CardEvent(
                                img: e.avatar ?? "",
                                title: e.title ?? "",
                                date: e.startTime ?? "",
                                id: e.id ?? 0,
                              ),
                            )
                    ],
                  ),
                ))
          ]))
        ],
 */
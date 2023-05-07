import 'package:app/src/presentation/app_auth/controller/app_auth_controller.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';

import '../../../theme/color_constants.dart';
import 'package:get/get.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  AppBarCustom({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  var controller = Get.put(AppAuthenController());
  String getGreeting() {
    var now = DateTime.now();
    var hour = now.hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    String? avatar = controller.userInfo.value.data?.userInfo?.avatar;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      toolbarHeight: kToolbarHeight + 20,
      // leadingWidth: 1,
      elevation: 0,
      title: Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                child: Obx(
              () => Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: AppImageNetwork(
                      url: avatar ??
                          "https://ui-avatars.com/api/?name=${"${controller.userInfo.value.data?.firstName}+${controller.userInfo.value.data?.lastName}"}",
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${getGreeting()}, ${controller.userInfo.value.data?.userInfo?.fullName}',
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

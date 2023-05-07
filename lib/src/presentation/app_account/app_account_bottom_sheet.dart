import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'controllers/app_account_controller.dart';

class BottomSheetAs extends StatelessWidget {
  BottomSheetAs({
    super.key,
    required this.controller,
  });

  final _controller = Get.put(AppAccountController(handlerLoading: () {}));

  final GFBottomSheetController controller;
  final ImagePicker picker = ImagePicker();
  Future<void> _chooseCamera() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    //print(image);
    if (image == null) {
      Get.snackbar(
        'Notification',
        'Please task your ICCID for verify account',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } else {
      _controller.verifyAccount(File(image.path));
      // AppReconizeInfo().recognizeInfoCard(File(image.path));
    }
    controller.hideBottomSheet();
  }

//Line 7 get card number, Line 9 => full name, Line 10=> Date of birth
  Future<void> _useLibraryGalaxy() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    // ignore: unnecessary_null_comparison
    if (image == null) {
      Get.snackbar(
        'Notification',
        'Please chooose your Image ICCID for verify account',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } else {
      _controller.verifyAccount(File(image.path));
    }
    controller.hideBottomSheet();
  }

  @override
  Widget build(BuildContext context) {
    return GFBottomSheet(
      controller: controller,
      maxContentHeight: 150,
      stickyHeaderHeight: 100,
      animationDuration: 300,
      contentBody: SizedBox(
        height: 200,
        // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            GFListTile(
              avatar: const Icon(Icons.photo),
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              title: const Text("Choose Library galaxy"),
              margin: const EdgeInsets.all(16).copyWith(bottom: 8),
              onTap: _useLibraryGalaxy,
            ),
            GFListTile(
              avatar: const Icon(Icons.linked_camera),
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              title: const Text("Choose Camera"),
              margin: const EdgeInsets.all(16).copyWith(top: 8),
              onTap: _chooseCamera,
            )
          ],
        ),
      ),
      stickyFooterHeight: 50,
    );
  }
}

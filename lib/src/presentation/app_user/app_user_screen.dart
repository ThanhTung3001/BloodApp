import 'dart:io';

import 'package:app/src/core/utils/date_format.dart';
import 'package:app/src/presentation/app_auth/controller/app_auth_controller.dart';
import 'package:app/src/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:get/get.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../widgets/app_image_network.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class AppUserInfoUpdate extends GetWidget<AppAuthenController> {
  AppUserInfoUpdate({super.key});

  var _controllerPhoneNumber = TextEditingController(text: "");
  var _controllerEmail = TextEditingController(text: "");
  var _controllerAddress = TextEditingController(text: "");
  String? avatarPath;
  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  Future<void> _chooseLib() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    //print(image);
    if (image == null) {
      Get.snackbar(
        'Notification',
        'Please task your avatar account',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } else {
      controller.setAvatar(File(image.path));
      avatarPath = await controller.uploadFile("avatars", File(image.path));
      print('avatarPath: $avatarPath');
    }
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      // Save the form data
      _updateInfo();

      // Perform any necessary actions with the form data
      // For example, submit it to a server or update the app's state
    } else {
      Get.snackbar(
        'Notification',
        'Form not validate',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void _updateInfo() {
    controller.updateInfo(
      address: _controllerAddress.text,
      avatar: avatarPath,
      email: _controllerEmail.text,
      phoneNumber: _controllerPhoneNumber.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    var userInfo = controller.userInfo.value.data?.userInfo;
    avatarPath = userInfo!.avatar!;

    _controllerPhoneNumber =
        TextEditingController(text: userInfo.phoneNumber ?? "");
    _controllerEmail = TextEditingController(text: userInfo.email ?? "");
    _controllerAddress = TextEditingController(text: userInfo.address ?? "");
    void setLoading() {
      if (context.loaderOverlay.visible) {
        context.loaderOverlay.hide();
      } else {
        context.loaderOverlay.show();
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Update account user"),
        ),
        body: LoaderOverlay(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Obx(() {
                if (controller.auth.isFalse) {
                  Get.to(AppRoutes.signIn);
                }
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(
                      //   height: 100,
                      // ),
                      SizedBox(
                        // alignment: ,
                        height: 200,
                        // width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 16, top: 16),
                              height: 150,
                              width: 150,
                              child: InkWell(
                                onTap: _chooseLib,
                                child: controller.haveFile.isFalse
                                    ? AppImageNetwork(
                                        url: avatarPath ?? "",
                                        borderRadius:
                                            BorderRadius.circular(100))
                                    : SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.file(
                                            controller.avatarPath.value,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          enabled: false,
                          initialValue: userInfo.iccid.toString(),
                          decoration: const InputDecoration(
                            labelText: 'No.',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          enabled: false,
                          initialValue: userInfo.fullName,
                          decoration: const InputDecoration(
                            labelText: 'Full name.',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          enabled: false,
                          initialValue:
                              DateFormatExtenstion.format(userInfo.birthDate),
                          decoration: const InputDecoration(
                            labelText: 'Date of birth.',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _controllerPhoneNumber,
                          enabled: true,
                          validator: (String? value) {
                            // Check if value is not empty and matches a valid phone number pattern
                            if (value!.isEmpty) {
                              return 'Please enter a phone number';
                            } else if (!RegExp(r'^\+?[0-9]{10,12}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null; // Return null if the input is valid
                          },
                          //  initialValue: userInfo.phoneNumber,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusColor: Colors.black54,
                            labelStyle: TextStyle(color: Colors.black54),
                            labelText: 'PhoneNumber.',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _controllerEmail,
                          // initialValue: userInfo.email,
                          validator: (value) {
                            // Check if value is not empty and matches a valid email pattern
                            if (value!.isEmpty) {
                              return 'Please enter an email address';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null; // Return null if the input is valid
                          },
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusColor: Colors.black54,
                            labelStyle: TextStyle(color: Colors.black54),
                            labelText: 'Email.',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _controllerAddress,
                          enabled: true,
                          validator: (value) {
                            // Check if value is not empty and contains at least one number and one letter
                            if (value!.isEmpty) {
                              return 'Please enter an address';
                            }
                            return null; // Return null if the input is valid
                          },
                          //     initialValue: userInfo.address,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            focusColor: Colors.black54,
                            labelStyle: TextStyle(color: Colors.black54),
                            labelText: 'Address.',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: GFButton(
                          onPressed: _submitForm,
                          text: "Update my info",
                          size: GFSize.LARGE,
                          fullWidthButton: true,
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}

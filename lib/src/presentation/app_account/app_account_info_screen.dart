import 'package:app/src/data/api/auth_client/auth_recognization.dart';
import 'package:app/src/theme/color_constants.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

import 'controllers/app_account_controller.dart';

class AccountInfoICCIDSreen extends StatelessWidget {
  AccountInfoICCIDSreen({super.key, required this.model});

  ResponseReconizeID model = ResponseReconizeID();

  var controller = Get.put(AppAccountController(handlerLoading: () {}));

  @override
  Widget build(BuildContext context) {
    var userInfo = model.data![0];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Verify Infomation"),
      ),
      body: Obx(() {
        if (controller.loading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.pink,
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(16).copyWith(top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // alignment: ,
                  height: 200,
                  // width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16, top: 16),
                        height: 150,
                        width: 150,
                        child: AppImageNetwork(
                            url:
                                "https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg",
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    enabled: false,
                    initialValue: userInfo.id,
                    decoration: const InputDecoration(
                      labelText: 'No.',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    enabled: false,
                    initialValue: userInfo.name,
                    decoration: const InputDecoration(
                      labelText: 'Full name.',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    enabled: false,
                    initialValue: userInfo.dob,
                    decoration: const InputDecoration(
                      labelText: 'Date of birth.',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    enabled: false,
                    initialValue: userInfo.sex == "NAM" ? "MALE" : "FEMALE",
                    decoration: const InputDecoration(
                      labelText: 'Sex.',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    enabled: false,
                    initialValue: userInfo.address,
                    decoration: const InputDecoration(
                      labelText: 'Address.',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    enabled: false,
                    initialValue: userInfo.nationality,
                    decoration: const InputDecoration(
                      labelText: 'Nationality.',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GFButton(
                    onPressed: () {
                      controller.acceptInfo();
                    },
                    text: "Accept",
                    size: GFSize.LARGE,
                    fullWidthButton: true,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
